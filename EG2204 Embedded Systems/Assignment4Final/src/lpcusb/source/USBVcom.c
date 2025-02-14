#include "LPC17xx.h"
#include "string.h"
#include "stdlib.h"
#include "../include/type.h"
#include "../include/lpcusb_type.h"
#include "../include/usbstruct.h"
#include "../include/usbapi.h"
#include "../include/usbdebug.h"
#include "../include/serial_fifo.h"
#include "../include/USBVcom.h"

// data structure for GET_LINE_CODING / SET_LINE_CODING class requests
typedef struct {
	U32		dwDTERate;
	U8		bCharFormat;
	U8		bParityType;
	U8		bDataBits;
} TLineCoding;

TLineCoding LineCoding = {115200, 0, 0, 8};
U8 abBulkBuf[64];
U8 abClassReqData[8];

U8 txdata[VCOM_FIFO_SIZE];
U8 rxdata[VCOM_FIFO_SIZE];

fifo_t txfifo;
fifo_t rxfifo;

const U8 abDescriptors[] = {

// device descriptor
	0x12,
	DESC_DEVICE,
	LE_WORD(0x0101),			// bcdUSB
	0x02,						// bDeviceClass
	0x00,						// bDeviceSubClass
	0x00,						// bDeviceProtocol
	MAX_PACKET_SIZE0,			// bMaxPacketSize
	LE_WORD(0xFFFF),			// idVendor
	LE_WORD(0x0005),			// idProduct
	LE_WORD(0x0100),			// bcdDevice
	0x01,						// iManufacturer
	0x02,						// iProduct
	0x03,						// iSerialNumber
	0x01,						// bNumConfigurations

// configuration descriptor
	0x09,
	DESC_CONFIGURATION,
	LE_WORD(67),				// wTotalLength
	0x02,						// bNumInterfaces
	0x01,						// bConfigurationValue
	0x00,						// iConfiguration
	0xC0,						// bmAttributes
	0x32,						// bMaxPower
// control class interface
	0x09,
	DESC_INTERFACE,
	0x00,						// bInterfaceNumber
	0x00,						// bAlternateSetting
	0x01,						// bNumEndPoints
	0x02,						// bInterfaceClass
	0x02,						// bInterfaceSubClass
	0x01,						// bInterfaceProtocol, linux requires value of 1 for the cdc_acm module
	0x00,						// iInterface
// header functional descriptor
	0x05,
	CS_INTERFACE,
	0x00,
	LE_WORD(0x0110),
// call management functional descriptor
	0x05,
	CS_INTERFACE,
	0x01,
	0x01,						// bmCapabilities = device handles call management
	0x01,						// bDataInterface
// ACM functional descriptor
	0x04,
	CS_INTERFACE,
	0x02,
	0x02,						// bmCapabilities
// union functional descriptor
	0x05,
	CS_INTERFACE,
	0x06,
	0x00,						// bMasterInterface
	0x01,						// bSlaveInterface0
// notification EP
	0x07,
	DESC_ENDPOINT,
	INT_IN_EP,					// bEndpointAddress
	0x03,						// bmAttributes = intr
	LE_WORD(8),					// wMaxPacketSize
	0x0A,						// bInterval
// data class interface descriptor
	0x09,
	DESC_INTERFACE,
	0x01,						// bInterfaceNumber
	0x00,						// bAlternateSetting
	0x02,						// bNumEndPoints
	0x0A,						// bInterfaceClass = data
	0x00,						// bInterfaceSubClass
	0x00,						// bInterfaceProtocol
	0x00,						// iInterface
// data EP OUT
	0x07,
	DESC_ENDPOINT,
	BULK_OUT_EP,				// bEndpointAddress
	0x02,						// bmAttributes = bulk
	LE_WORD(MAX_PACKET_SIZE),	// wMaxPacketSize
	0x00,						// bInterval
// data EP in
	0x07,
	DESC_ENDPOINT,
	BULK_IN_EP,					// bEndpointAddress
	0x02,						// bmAttributes = bulk
	LE_WORD(MAX_PACKET_SIZE),	// wMaxPacketSize
	0x00,						// bInterval

	// string descriptors
	0x04,
	DESC_STRING,
	LE_WORD(0x0409),

	0x0E,
	DESC_STRING,
	'L', 0, 'P', 0, 'C', 0, 'U', 0, 'S', 0, 'B', 0,

	0x14,
	DESC_STRING,
	'U', 0, 'S', 0, 'B', 0, 'S', 0, 'e', 0, 'r', 0, 'i', 0, 'a', 0, 'l', 0,

	0x12,
	DESC_STRING,
	'D', 0, 'E', 0, 'A', 0, 'D', 0, 'C', 0, '0', 0, 'D', 0, 'E', 0,

// terminating zero
	0
};


/**
	Local function to handle incoming bulk data

	@param [in] bEP
	@param [in] bEPStatus
 */
void BulkOut(U8 bEP, U8 bEPStatus)
{
	int i, iLen;

	if (fifo_free(&rxfifo) < MAX_PACKET_SIZE) {
		// may not fit into fifo
		return;
	}

	// get data from USB into intermediate buffer
	iLen = USBHwEPRead(bEP, abBulkBuf, sizeof(abBulkBuf));
	for (i = 0; i < iLen; i++) {
		// put into FIFO
		if (!fifo_put(&rxfifo, abBulkBuf[i])) {
			// overflow... :(
			ASSERT(FALSE);
			break;
		}
	}
}


/**
	Local function to handle outgoing bulk data

	@param [in] bEP
	@param [in] bEPStatus
 */
void BulkIn(U8 bEP, U8 bEPStatus)
{
	int i, iLen;

	if (fifo_avail(&txfifo) == 0) {
		// no more data, disable further NAK interrupts until next USB frame
		USBHwNakIntEnable(0);
		return;
	}

	// get bytes from transmit FIFO into intermediate buffer
	for (i = 0; i < MAX_PACKET_SIZE; i++) {
		if (!fifo_get(&txfifo, &abBulkBuf[i])) {
			break;
		}
	}
	iLen = i;

	// send over USB
	if (iLen > 0) {
		USBHwEPWrite(bEP, abBulkBuf, iLen);
	}
}


/**
	Local function to handle the USB-CDC class requests

	@param [in] pSetup
	@param [out] piLen
	@param [out] ppbData
 */
BOOL HandleClassRequest(TSetupPacket *pSetup, int *piLen, U8 **ppbData)
{
	switch (pSetup->bRequest) {

	// set line coding
	case SET_LINE_CODING:
DBG("SET_LINE_CODING\n");
		memcpy((U8 *)&LineCoding, *ppbData, 7);
		*piLen = 7;
DBG("dwDTERate=%u, bCharFormat=%u, bParityType=%u, bDataBits=%u\n",
	LineCoding.dwDTERate,
	LineCoding.bCharFormat,
	LineCoding.bParityType,
	LineCoding.bDataBits);
		break;

	// get line coding
	case GET_LINE_CODING:
DBG("GET_LINE_CODING\n");
		*ppbData = (U8 *)&LineCoding;
		*piLen = 7;
		break;

	// set control line state
	case SET_CONTROL_LINE_STATE:
		// bit0 = DTR, bit = RTS
DBG("SET_CONTROL_LINE_STATE %X\n", pSetup->wValue);
		break;

	default:
		return FALSE;
	}
	return TRUE;
}


/**
	Initialises the VCOM port.
	Call this function before using VCOM_putchar or VCOM_getchar
 */
void VCOM_init(void)
{
	fifo_init(&txfifo, txdata);
	fifo_init(&rxfifo, rxdata);
	NVIC_EnableIRQ(USB_IRQn);
}


/**
	Writes one character to VCOM port

	@param [in] c character to write
	@returns character written, or EOF if character could not be written
 */
int VCOM_putchar(int c)
{
	return fifo_put(&txfifo, c) ? c : EOF;
}

void VCOM_putstring (char datasend[])
{
	uint32_t lenghtdata = 0;
	uint32_t var = 0;
	lenghtdata = strlen(datasend);
	for (var = 0; var < lenghtdata; ++var) {
		BOOL done = FALSE;
		while (!done)
		{
			done = fifo_put(&txfifo, datasend[var]);
		}
	}
}


void VCOM_putstring2 (char datasend[])
{
	uint32_t lenghtdata = 0;
	uint32_t var = 0;
	lenghtdata = strlen(datasend);
	for (var = 0; var < lenghtdata; ++var) {
		BOOL done = FALSE;
		while (!done){
			done = fifo_put(&txfifo, datasend[var]);
		}
	}
}


/**
	Reads one character from VCOM port

	@returns character read, or EOF if character could not be read
 */
int VCOM_getchar(void)
{
	U8 c;

	return fifo_get(&rxfifo, &c) ? c : EOF;
}

int VCOM_GetString(char *data)
{

	uint32_t lenghtcheck;
	uint32_t var = 0;
	U8 c;
	lenghtcheck = fifo_avail(&rxfifo);
	char datarec[lenghtcheck + 1];

	for (var = 0; var <= lenghtcheck; ++var)
	{
		datarec[var] = fifo_get(&rxfifo, &c) ? c : EOF;
	}

	datarec[lenghtcheck + 1] = 0;
	data = (char *) malloc((lenghtcheck + 1) );
	strncpy(data, datarec, (lenghtcheck+1));
	if (strncpy(data, datarec, (lenghtcheck + 1)))
			{
	return 1;
			}
	return 0;
}

char* VCOM_RecieveString(void)
{
	uint32_t lenghtcheck;
	uint32_t var = 0;
	U8 c;
	lenghtcheck = fifo_avail(&rxfifo);
	char datarec[lenghtcheck + 1];

	for (var = 0; var <= lenghtcheck; ++var)
	{
		datarec[var] = fifo_get(&rxfifo, &c) ? c : EOF;
	}

	char *data = (char *) malloc((lenghtcheck + 1) );
	strncpy(data, datarec, lenghtcheck);
	data[lenghtcheck] = 0;
	return data;
}

int VCOM_Available(void)
{
	int aval = 0;
	aval = fifo_avail(&rxfifo);
	return aval;
}

/**
	Interrupt handler

	Simply calls the USB ISR
 */
//void USBIntHandler(void)
void USB_IRQHandler(void)
{
	USBHwISR();
}

void USB_init (void)
{
	// initialise stack
	USBInit();

	// register descriptors
	USBRegisterDescriptors(abDescriptors);

	// register class request handler
	USBRegisterRequestHandler(REQTYPE_TYPE_CLASS, HandleClassRequest, abClassReqData);

	// register endpoint handlers
	USBHwRegisterEPIntHandler(INT_IN_EP, NULL);
	USBHwRegisterEPIntHandler(BULK_IN_EP, BulkIn);
	USBHwRegisterEPIntHandler(BULK_OUT_EP, BulkOut);

	// register frame handler
	USBHwRegisterFrameHandler(USBFrameHandler);

	// enable bulk-in interrupts on NAKs
	USBHwNakIntEnable(INACK_BI);
}

void USBFrameHandler(U16 wFrame)
{
	if (fifo_avail(&txfifo) > 0) {
		// data available, enable NAK interrupt on bulk in
		USBHwNakIntEnable(INACK_BI);
	}
}

void enable_USB_interrupts(void)
{
	NVIC_EnableIRQ(USB_IRQn);
}

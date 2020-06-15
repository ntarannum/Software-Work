import serial, io
#import numpy
#import matplotlib.pyplot as plt
#from drawnow import *
from datetime import datetime

arduinoData = serial.Serial('COM3',9600)
outfile = 'data.txt'

sio=io.TextIOWrapper(io.BufferedRWPair(arduinoData,arduinoData,1),encoding='ascii',newline='\r')

with open(outfile,'w') as f:
    while True: # while loop that loops forever
        while (arduinoData.inWaiting()==0): #Wait here until there is data
            pass #do nothing
        arduinoString = sio.readline()
        f.write(datetime.now(),isoformat() + '\t' + arduinoString + '\n')
        f.flush()

#!/usr/bin/python3

import serial

port = "/dev/ttyACM0"

with open("test.dat", "w") as outfile:
    try:
        with serial.Serial(port, 9600, timeout=1) as ser:
            n = 0
            while ser.is_open:
                # Convert to UTF-8 from byte string, and strip return char(s)
                line = ser.readline().decode('UTF-8').rstrip()
                outfile.write("{}\n".format(line))
                print(n, line)
                n = n + 1
                # value = int(line)
                # if (value < 500):
                #     ser.write(b'R')
                # else:
                #     ser.write(b'B')
    except serial.serialutil.SerialException as e:
        print("Serial communications error:")
        print(e)


import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns
from scipy import signal

import peakutils
import pywt
import wfdb

#lowpass = 100
#highpass = 0.01

#fig, ax = plt.subplots(3, sharex=True)

#arr = plt.subplots(3, sharex=True)

#a, b = signal.butter(6, (highpass, lowpass), btype='bandpass', analog=True)
#filtered_signal = signal.lfilter(b, a, dataset)
#smoothed_signal = signal.cspline1d(filtered_signal, lamb=1000)

#arr[0].plot(dataset)
#arr[1].plot(filtered_signal)
#arr[2].plot(smoothed_signal)

#ax[0].plot(dataset)
#ax[1].plot(filtered_signal)
#ax[2].plot(smoothed_signal)

arr = []
inp = open ("test.txt","r")
#read line into array
for line in inp.readlines():
    # loop over the elemets, split by whitespace
    for i in line.split():
        # convert to integer and append to the list
        arr.append(int(i))

# fs = 100
# t = np.arange(1000)/fs
# signala = np.sin(2*np.pi*100*t)
# plt.plot(t, signala, label='a')
#
#fc = 100
#Wn = fc / (fc / 2)
# b, a = signal.butter(5, w, 'low')
# output = signal.filtfilt(b, a, signala)
# plt.plot(t, output, label='filtered')
# plt.legend()
# plt.show()

b, a = signal.butter(6, 0.5, 'low')
output_signal = signal.filtfilt(b, a, arr)
plt.plot(arr, label='original')
plt.plot(output_signal, label='filtered')
plt.legend()
plt.show()










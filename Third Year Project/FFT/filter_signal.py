import matplotlib.pyplot as plt
from scipy import signal
from scipy.fftpack import fft
import numpy as np
import heartpy as hp

#I've already done this part!
# filename = 'filtered_signal_order6_wn_0.5.txt'
# with open(filename, mode="w") as outfile:
#     for s in output_signal:
#         outfile.write("%s\n" % s)


#this code is not needed anymore because we can use floats and we don't need to make an integer array
#this makes the bmp have an incorrect value
# fil_sig = []
# inp = open ("filtered_signal_order6_wn_0.5.txt","r")
# #read line into array
# for line in inp.readlines():
#     # loop over the elements, split by a full stop
#     for i in line.split("."):
#         # convert to integer and append to the list
#         fil_sig.append(int(i))

#taking every other element and putting it into a filtered signal array, this is an integer array so the bmp can be found
#again not needed

# print(fil_sig)
# fil_sig = fil_sig[0::2]
# print(fil_sig)

# new_int_arr = np.array(fil_sig)
# np.asarray(new_int_arr, dtype=int)
# print(new_int_arr)

def text_file_to_array(filename):
    arr = []
    inp = open(filename, "r")
    #read line into array
    for line in inp.readlines():
        # loop over the elements, split by whitespace
        for i in line.split():
            # convert to integer and append to the list
            arr.append(int(i))
    return arr

dataset = text_file_to_array("test_new.txt")

def butterworth_filter(orig_sig):
    b, a = signal.butter(6, 0.5, 'low')
    output_signal = signal.filtfilt(b, a, orig_sig)
    return output_signal

def plot_orig_filtered(orig_sig, filtered):
    plt.plot(orig_sig, label='original')
    plt.plot(filtered, label='filtered')
    plt.legend()
    return plt.show()


def bpm_from_peaks(freq, sig, threshold):
    beat_count = 0
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            beat_count = beat_count + 1
    fs = freq
    n = len(sig)
    duration_in_seconds = n/fs
    duration_in_minutes = duration_in_seconds/60
    bmp = beat_count/duration_in_minutes
    return round(bmp)


# filtered_sig = butterworth_filter(dataset)
# plt.plot(dataset)
# plt.show()
# plot_orig_filtered(dataset, filtered_sig)
# print("bpm =", bpm_from_peaks(100, filtered_sig, 530))



#hemal_sig = text_file_to_array("ecg_hemal.txt")
#plt.plot(hemal_sig)
#plt.show()
#print("bpm =", bpm_from_peaks(1000, hemal_sig, 2660))

testdata = text_file_to_array("physionet1.txt")
print(testdata)
print("bpm =", bpm_from_peaks(720, testdata, 2110))


# org_fft = np.fft.fft(np.array(filtered_sig).flatten())
# freq = np.fft.fftfreq(filtered_sig.size, 1/100.)
# f1 = plt.figure()
# A1 = f1.add_subplot(211)
# A1.plot(freq, np.abs(org_fft))
# plt.show()




# N = 1639
# T = 100
# x = np.linspace(0, N*T, N)
# y = np.array(filtered_sig)
# padded = np.pad(y, 1650, 'constant')
# yf = fft(y)
#
# #however if I do yf = fft(fft(y)) the fourier transform looks correct but I don't understand exactly why that is the case
#
# #yf = np.fft.rfft(y, 1650)
#
# xf = np.linspace(0.0, 1.0/(2.0*T), N)
#
# plt.plot(xf, abs(yf))
# plt.grid()
# plt.show()



data = hp.get_data('test_new_filtered.csv') #data.csv is sampled at 100Hz
working_data, measures = hp.process(data, 100.0, report_time=True)
hp.plotter(working_data, measures)
print('bmp = ', measures['bpm'])
print('standard deviation = ', measures['sdsd'])
print('rms of sd = ', measures['rmssd'])

# physionet data is not working
# physionet = hp.get_data('physionet1.csv') #data.csv is sampled at 720Hz
# working_data, measures = hp.process(physionet, 720.0, report_time=True)
# hp.plotter(working_data, measures)
# print('bmp = ', measures['bpm'])
# print('standard deviation = ', measures['sdsd'])
# print('rms of sd = ', measures['rmssd'])


#hemal's data gives wrong values
# hemal_ecg = hp.get_data('hemal_ecg.csv') #data.csv is sampled at 1000Hz
# working_data, measures = hp.process(hemal_ecg, 1000.0, report_time=True)
# hp.plotter(working_data, measures)
# print('bmp = ', measures['bpm'])
# print('standard deviation = ', measures['sdsd'])
# print('rms of sd = ', measures['rmssd'])

import matplotlib.pyplot as plt
from scipy import signal
from scipy.signal import find_peaks
import numpy as np

#converting the text file with heart data to an array for processing

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


#butterworth filter for removing noise on signal
#still need to explain why a butterworth filter has been used
def butterworth_filter(orig_sig):
    b, a = signal.butter(6, 0.5, 'low')
    output_signal = signal.filtfilt(b, a, orig_sig)
    return output_signal


#function to plot original and filtered signals on a graph for comparison
def plot_orig_filtered(orig_sig, filtered):
    plt.plot(orig_sig, label='original')
    plt.plot(filtered, label='filtered')
    plt.legend()
    return plt.show()


#original r_peak finding function with bpm calculator
def bpm_from_peaks(freq, sig, threshold):
    beat_count = 0
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            beat_count = beat_count + 1
    fs = freq
    n = len(sig)
    duration_in_seconds = n/fs
    duration_in_minutes = duration_in_seconds/60
    bpm = beat_count/duration_in_minutes
    return round(bpm)



#function which finds the position of the r peaks
def r_peak_positions(freq, filtered, graph = None):
    peaks, _ = find_peaks(filtered, distance=freq/2)
    #for physionet we have to use the distance as the sampling frequency, however for our data dividing by 2 gives accurate results
    position_of_peaks = []
    for i in peaks[1:]:
        position_of_peaks.append(int(i))
    if graph is True:
        plt.plot(filtered)
        plt.plot(peaks, filtered[peaks], "x")
        return plt.show()
    else:
        return position_of_peaks


def bpm_from_r_peak_positions(filtered, freq, r_peak_array):
    fs = freq
    n = len(filtered)
    duration_in_seconds = n/fs
    duration_in_minutes = duration_in_seconds/60
    bpm = len(r_peak_array)/duration_in_minutes
    return round(bpm)



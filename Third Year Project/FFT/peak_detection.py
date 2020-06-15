import matplotlib.pyplot as plt
from scipy import signal
from scipy.signal import find_peaks
import numpy as np
import math
import sys


def text_file_to_array(filename):
    arr = []
    try:
        inp = open(filename, "r")
        #read line into array
        for line in inp.readlines():
            # loop over the elements, split by whitespace
            for i in line.split():
                # convert to integer and append to the list
                arr.append(int(i))
        return arr
    except FileNotFoundError:
        print("File does not exist")
        sys.exit()


def butterworth_filter(orig_sig):
    b, a = signal.butter(6, 0.5, 'low')
    output_signal = signal.filtfilt(b, a, orig_sig)
    return output_signal

def plot_orig_filtered(orig_sig, filtered):
    plt.plot(orig_sig, label='original')
    plt.plot(filtered, label='filtered')
    plt.legend()
    return plt.show()

def peak_finder(sig, threshold):
    #for physionet data do not use the filtered data
    #peak_positions = []
    r_peaks = []
    #beat_count = 0
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            #beat_count = beat_count + 1
            #peak_positions.append(i)
            r_peaks.append(sig[i])
    # fs = freq
    # n = len(sig)
    # duration_in_seconds = n/fs
    # duration_in_minutes = duration_in_seconds/60
    # bpm = beat_count/duration_in_minutes
    # print("r_peaks = ", r_peaks)
    # print("peak_sample_positions = ", peak_positions)
    # print("bpm_from_makeshift = ", round(bpm))
    return r_peaks

def bpm_from_peak_finder(freq, sig, threshold):
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

def sample_positions_to_time(freq, sig, threshold):
    positions = []
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            i = i/freq
            positions.append(i)
    return positions

def r_peak_positions(freq, filtered, graph = None):
    peaks, _ = find_peaks(filtered, distance=freq/2)
    #for physionet we have to use the distance as the sampling frequency, however for our data dividing by 2 gives accurate results
    position_of_peaks = []
    # we also have to change peaks[1:] to just peaks for physionet
    for i in peaks:
        position_of_peaks.append(int(i))
    if graph is True:
        plt.plot(filtered)
        plt.plot(peaks, filtered[peaks], "x")
        return plt.show()
    else:
        return position_of_peaks

# def bpm_from_r_peak_positions(filtered, freq, r_peak_array):
#     fs = freq
#     n = len(filtered)
#     duration_in_seconds = n/fs
#     duration_in_minutes = duration_in_seconds/60
#     bpm = len(r_peak_array)/duration_in_minutes
#     return print("bpm from peak positions", round(bpm))

# def r_peak_values(filtered, freq):
#     #again have to change distance to freq for physionet
#     peaks, _ = find_peaks(filtered, distance=freq/2)
#     r_peaks_array = []
#     #same goes for physionet here we don't type peaks[1:]
#     for i in filtered[peaks]:
#         r_peaks_array.append(int(i))
#     return r_peaks_array


def final_r_peaks(r_peaks_array):
    final_peaks = []
    avg = sum(r_peaks_array)/len(r_peaks_array)
    error = 0.05 * avg
    upper_end = avg + error
    lower_end = avg - error
    for i in range(len(r_peaks_array)):
        if upper_end > r_peaks_array[i] > lower_end:
            final_peaks.append(r_peaks_array[i])
    return final_peaks


# def root_mean_square_differences(r_peaks_times):
#     square = []
#     r_peak_diffs = np.diff(r_peaks_times)
#     #print(r_peak_diffs)
#     for i in r_peak_diffs:
#         # if i == (len(r_peak_diffs) - 2):
#         #     break
#         i = i*i
#         square.append(i)
#     #print(square)
#     sum_of_squares = sum(square)
#     #print(sum_of_squares)
#     mean = sum_of_squares/len(square)
#     #print(mean)
#     rmssd = math.sqrt(mean)
#     return rmssd


def average_differences(r_peak_times):
    diffs = np.diff(r_peak_times)
    avg_diffs = sum(diffs)/len(diffs)
    return avg_diffs

def root_mean_square_differences(r_peak_times):
    square = []
    r_peak_diffs = np.diff(r_peak_times)
    for i in range(len(r_peak_diffs) - 2):
        r_peak_diffs[i] = r_peak_diffs[i] * r_peak_diffs[i]
        square.append(r_peak_diffs[i])
    sum_of_squares = sum(square)
    mean = sum_of_squares/len(square)
    rmssd = math.sqrt(mean)
    return rmssd

# https://stackoverflow.com/questions/24624039/how-to-get-hrv-heart-rate-variability-from-hr-heart-rate
# this is the same as sdnn
def standard_dev_diffs(r_peak_times):
    diffs = np.diff(r_peak_times)
    mean_of_diffs = sum(diffs)/len(diffs)
    diff_with_mean = []
    square = []
    for i in r_peak_times:
        i = i - mean_of_diffs
        diff_with_mean.append(i)
        for j in diff_with_mean:
            j = j * j
            square.append(j)
    sum_of_squares = sum(square)
    mean = sum_of_squares/len(square)
    sd = math.sqrt(mean)
    return sd


# dataset = text_file_to_array("test_new.txt")
#
# filtered_sig = butterworth_filter(dataset)
# #must filter before we use the function given below else peaks aren't detected using the peakutils function
#
# r_peaks_on_graph = r_peak_positions(100, filtered_sig, True)
#
#
# r_peak_positions_array = r_peak_positions(100, filtered_sig)
# print("new_r_peak_positions = ", r_peak_positions_array)
#
# r_peak_values_array = r_peak_values(filtered_sig, 100)
# print("orig_r_peaks = ", r_peak_values_array)
#
# r_peaks = final_r_peaks(r_peak_values_array)
# print("new_r_peaks = ", r_peaks)
#
#
# # differences = np.diff(r_peak_values_array)
# # print(differences)
#
# #print("bpm = ", (bpm_from_r_peak_positions(filtered_sig, 100, r_peak_positions_array)))
#peak_finder(100, filtered_sig, 530)

# print("average = ", average(r_peaks))
# print("standard deviation = ", standard_dev(r_peaks))
# print("rmssd = ", root_mean_square_differences(r_peaks))


atrial = text_file_to_array("atrial_04043_ecg1.txt")
time_atrial = sample_positions_to_time(250, atrial, 170)
print("bpm atrial = ", bpm_from_peak_finder(250, atrial, 170))
print("average differences atrial = ", average_differences(time_atrial))
print("sdsd atrial = ", standard_dev_diffs(time_atrial))
print("rmssd atrial = ", root_mean_square_differences(time_atrial))

atrial_2 = text_file_to_array("atrial_04015_ecg1.txt")
#filt_atrial_2 = butterworth_filter(atrial_2)
# plot_orig_filtered(atrial_2, butterworth_filter(atrial_2))
# plt.plot(atrial_2)
# plt.plot(atrial)
# plt.show()
time_atrial_2 = sample_positions_to_time(250, atrial_2, 100)
# peaks_atrial = r_peak_positions(250, filt_atrial_2, graph=True)
print("\nbpm atrial 2 = ", bpm_from_peak_finder(250, atrial_2, 100))
print("average differences atrial 2 = ", average_differences(time_atrial_2))
print("sdsd atrial 2 = ", standard_dev_diffs(time_atrial_2))
print("rmssd atrial 2 = ", root_mean_square_differences(time_atrial_2))

atrial_3 = text_file_to_array("atrial_05261_ecg1.txt")
# plt.plot(atrial_3)
# plt.show()
time_atrial_3 = sample_positions_to_time(250, atrial_3, 200)
print("\nbpm atrial 3 = ", bpm_from_peak_finder(250, atrial_3, 200))
print("average differences atrial 3 = ", average_differences(time_atrial_3))
print("sdsd atrial 3 = ", standard_dev_diffs(time_atrial_3))
print("rmssd atrial 3 = ", root_mean_square_differences(time_atrial_3))



mydata = text_file_to_array("test_new.txt")
filteredsig = butterworth_filter(mydata)
plt.plot(filteredsig)
plt.show()
time_mine = sample_positions_to_time(100, filteredsig, 530)
print("\nbpm mine = ", bpm_from_peak_finder(100, filteredsig, 530))
print("average differences mine = ", average_differences(time_mine))
print("sdsd mine = ", standard_dev_diffs(time_mine))
print("rmssd mine = ", root_mean_square_differences(time_mine))


sinus = text_file_to_array("normal_sinus16272_ecg1_128.txt")
#filteredsinus = butterworth_filter(sinus)
#plot_orig_filtered(sinus, filteredsinus)
time_sinus = sample_positions_to_time(128, sinus, 100)
print("\nbpm normal = ", bpm_from_peak_finder(128, sinus, 100))
print("average differences normal = ", average_differences(time_sinus))
print("sdsd normal = ", standard_dev_diffs(time_sinus))
print("rmssd normal = ", root_mean_square_differences(time_sinus))

sinus_2 = text_file_to_array("normal_sinus16272_ecg1_128.txt")
#filteredsinus = butterworth_filter(sinus)
#plot_orig_filtered(sinus, filteredsinus)
time_sinus_2 = sample_positions_to_time(128, sinus_2, 100)
print("\nbpm normal 2 = ", bpm_from_peak_finder(128, sinus_2, 100))
print("average differences normal 2 = ", average_differences(time_sinus_2))
print("sdsd normal 2 = ", standard_dev_diffs(time_sinus_2))
print("rmssd normal 2 = ", root_mean_square_differences(time_sinus_2))

#print("bpm = ", (bpm_from_peaks(128, filtered_sig, )))

#for physionet data use the initial bpm function not the new one, else the value is wrong
#and don't use the filtered signal for this


hemal_sig = text_file_to_array("ecg_hemal_1000.txt")
filtered_hemal = butterworth_filter(hemal_sig)
#plt.plot(hemal_sig)
#plt.show()
time_hemal = sample_positions_to_time(1000, filtered_hemal, 2660)
print("\nbpm Hemal_1 = ", bpm_from_peak_finder(1000, hemal_sig, 2660))
print("average differences Hemal_1 = ", average_differences(time_hemal))
print("sdsd Hemal_1 = ", standard_dev_diffs(time_hemal))
print("rmssd Hemal_1 = ", root_mean_square_differences(time_hemal))

hemal_sig_2 = text_file_to_array("ecg_hemal_v2_1000.txt")
filtered_hemal_2 = butterworth_filter(hemal_sig_2)
# plt.plot(filtered_hemal)
# plt.show()
time_hemal_2 = sample_positions_to_time(1000, filtered_hemal, 2620)
print("\nbpm Hemal_2 = ", bpm_from_peak_finder(1000, hemal_sig, 2620))
print("average differences Hemal_2 = ", average_differences(time_hemal_2))
print("sdsd Hemal_2 = ", standard_dev_diffs(time_hemal_2))
print("rmssd Hemal_2 = ", root_mean_square_differences(time_hemal_2))

arrhythmia_1 = text_file_to_array("arrhythmia_100_MLII_360.txt")
# plt.plot(arrhythmia_1)
# plt.show()
time_arr_1 = sample_positions_to_time(360, arrhythmia_1, 1050)
print("\nbpm arrhythmia_1 = ", bpm_from_peak_finder(360, arrhythmia_1, 1050))
print("average differences arrhythmia_1 = ", average_differences(time_arr_1))
print("sdsd arrhythmia_1 = ", standard_dev_diffs(time_arr_1))
print("rmssd arrhythmia_1 = ", root_mean_square_differences(time_arr_1))

arrhythmia_2 = text_file_to_array("arrhythmia_101_MLII_360.txt")
# plt.plot(arrhythmia_2)
# plt.show()
time_arr_2 = sample_positions_to_time(360, arrhythmia_2, 1150)
print("\nbpm arrhythmia_2 = ", bpm_from_peak_finder(360, arrhythmia_2, 1150))
print("average differences arrhythmia_2 = ", average_differences(time_arr_2))
print("sdsd arrhythmia_2 = ", standard_dev_diffs(time_arr_2))
print("rmssd arrhythmia_2 = ", root_mean_square_differences(time_arr_2))


arrhythmia_3 = text_file_to_array("arrhythmia_116_MLII_360.txt")
# plt.plot(arrhythmia_3)
# plt.show()
time_arr_3 = sample_positions_to_time(360, arrhythmia_3, 1100)
print("\nbpm arrhythmia_3 = ", bpm_from_peak_finder(360, arrhythmia_3, 1100))
print("average differences arrhythmia_3 = ", average_differences(time_arr_3))
print("sdsd arrhythmia_3 = ", standard_dev_diffs(time_arr_3))
print("rmssd arrhythmia_3 = ", root_mean_square_differences(time_arr_3))
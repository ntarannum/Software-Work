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


def butterworth_filter(sig):
    b, a = signal.butter(6, 0.5, 'low')
    output_signal = signal.filtfilt(b, a, sig)
    return output_signal

# def write_to_file(sig, freq):
#     my_list = []
#     for i in range(len(sig)):
#         i = i/freq
#     #print(i)
#     my_list.append(i)
#     with open('your_file.txt', 'w') as f:
#         for item in my_list:
#             print >> your_file.txt, item


def threshold(sig):
    #threshold_value = (max(sig)+min(sig)) / 2
    diff = max(sig) - min(sig)
    threshold_value = max(sig) - diff * 0.33
    return threshold_value


def cross_peaks(sig, threshold):
    r_peaks = []
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            r_peaks.append(sig[i])
        else:
            r_peaks.append(None)
    r_peaks.extend([None, None, None])
    return r_peaks


def r_peaks(sig, threshold):
    r_peaks = []
    for i in range(1, len(sig) - 2):
        if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
            r_peaks.append(sig[i])
    return r_peaks


def normalise(sig):
    norm_sig = []
    diff = max(sig) - min(sig)
    for i in sig:
        i = (i - min(sig)) / diff
        norm_sig.append(i)
    return norm_sig


def norm_thresh(sig):
    return max(sig) - 0.33


def bpm_from_peak_finder(freq, sig, threshold):
    beat_count = 0
    for i in range(0, len(sig) - 1):
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


def plot_peaks(sig, r_peaks):
    plt.plot(sig, label='filtered signal')
    plt.plot(r_peaks, "x", label='peaks')
    # times = []
    # for i in range(len(sig)):
    #     i = i/freq
    #     #print(i)
    #     times.append(i)
    #plt.xticks(np.arange(min(times), max(times)))
    return plt.show()


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


def standard_dev(list):
    mean_of_diffs = sum(list)/len(list)
    diff_with_mean = []
    square = []
    for i in list:
        i = i - mean_of_diffs
        diff_with_mean.append(i)
        for j in diff_with_mean:
            j = j * j
            square.append(j)
    sum_of_squares = sum(square)
    mean = sum_of_squares/len(square)
    sd = math.sqrt(mean)
    return sd

def arrhythmia_type(bpm):
    if bpm < 50:
        print("Bradycardia detected!")
    elif bpm > 100:
        print("Tachycardia detected!")
    else:
        return print("Heart rate normal")


def disp_normalised(file):
    sig = text_file_to_array(file)
    filtered = butterworth_filter(sig)
    norm_sig = normalise(filtered)
    thresh = norm_thresh(norm_sig)
    peaks = cross_peaks(norm_sig, thresh)
    return plot_peaks(norm_sig, peaks)


def disp(file):
    sig = text_file_to_array(file)
    filtered = butterworth_filter(sig)
    #norm_sig = normalise(filtered)
    thresh = threshold(filtered)
    peaks = cross_peaks(filtered, thresh)
    return plot_peaks(filtered, peaks)


def find_closest_points(height, norm_sig, n):
    num_of_points = 25
    points_1 = []
    points_2 = []
    keys = norm_sig.keys()
    #for loop below will iterate back from the location of the peak at n by 25 samples.
    for i in range(n, n-num_of_points):
        p1 = norm_sig.get(keys[i])
        p2 = norm_sig.get(keys[i-1])
        if p1 > height and p2 < height:
            points_1.append([i/100, p1]) #returns index and height value
            points_1.append([(i+1)/100, p2])
    #for loop below will iterate forward from the location of the peak at n by 25 samples.
    for i in range(n, n+num_of_points):
        p1 = norm_sig.get(keys[i])
        p2 = norm_sig.get(keys[i+1])
        if p1 > height and p2 < height:
            points_1.append([i/100, p1])
            points_1.append([(i+1)/100, p2])
    return [points_1, points_2]


def interpolate(x1, y1, x2, y2):
    m = (y2 - y1)/(x2 - x1)
    c = y1 - m*x1
    return lambda y: (y-c)/m


def peak_width(norm_sig, peaks):
    peak_widths = []
    n = 0
    for peak_time in peaks:
        for sig_time in norm_sig:
            if peak_time == sig_time:
                peak_half_height = 0.5*norm_sig.get(peak_time, 0)
                closest_points = find_closest_points(peak_half_height, norm_sig, n)
                f1 = interpolate(closest_points[0][1], closest_points[0][2], closest_points[0][3], closest_points[0][4])
                f2 = interpolate(closest_points[1][1], closest_points[1][2], closest_points[1][3], closest_points[1][4])
                f1_intersect = f1(peak_half_height)
                f2_intersect = f2(peak_half_height)
                peak_widths.append(abs(f1_intersect-f2_intersect))
            n += 1
        n = 0
    return peak_widths


def heart_monitor(file, freq):
    sig = text_file_to_array(file)
    filtered = butterworth_filter(sig)
    # write_to_file(filtered, freq)
    min_thresh = threshold(filtered)
    #print("half-height", width_at_half_height(peaks))
    heart_rate = bpm_from_peak_finder(freq, filtered, min_thresh)
    print("bpm", heart_rate)
    if arrhythmia_type(heart_rate) < 50:
        print("Bradycardia detected")
    elif arrhythmia_type(heart_rate) > 100:
        print("Tachycardia detected")
    else:
        print("Heart Rate normal")
    disp(file)
    r_peaks_time = sample_positions_to_time(freq, filtered, min_thresh)
    print("sdsd = ", standard_dev_diffs(r_peaks_time))
    if standard_dev_diffs(r_peaks_time) > 15:
        print("Arrhythmia detected")
    print("rmssd = ", root_mean_square_differences(r_peaks_time))
    if root_mean_square_differences(r_peaks_time) < 0.6:
        print("Arrhythmia detected")
    normalised = normalise(filtered)
    norm_dict = dict(zip(r_peaks_time, normalised))
    peak_widths = peak_width(norm_dict, r_peaks_time)
    print("standard deviation of width of r peaks = ", standard_dev(peak_widths))
    return 0


#heart_monitor("test_new.txt", 100)

# heart_monitor("samples_hemal.txt", 128)

# print()
# print("sinus rhythm")
#
#heart_monitor("norm_17052.txt", 128)
#
#heart_monitor("normal_sinus16272_ecg1_128_bpm=60.txt", 128)
#
#heart_monitor("normal_sinus16273_ecg1_128_bpm=96.txt", 128)
# #
# print()
# print("arrhythmia")
# heart_monitor("arr_203.txt", 360) #
# heart_monitor("arr_207.txt", 360) #
# heart_monitor("arr_232.txt", 360) #bradycardia
#
# print()
# print("atrial")
# #heart_monitor("atrial_04015_ecg1.txt", 250)
# heart_monitor("atrial_04908.txt", 250) #tachycardia
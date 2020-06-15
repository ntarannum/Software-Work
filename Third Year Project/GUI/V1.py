from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np
import math

#pending tasks: print output on gui and tell the user when it has arrhythmia, exception handling,
# print the ecg trace on the screen



class Gui:


    def __init__(self, master):
        self.master = master
        master.title("Heart Diagnostic Monitor")
        master.geometry("355x80")

        # ******* Main Menu ********
        menu = Menu(root)
        master.config(menu=menu)

        fileMenu = Menu(menu)
        menu.add_cascade(label="File", menu=fileMenu)
        fileMenu.add_command(label="Exit", command=self.quit)


        #********** Buttons *************
        self.load_data_button = Button(master, text='Upload Data', relief="ridge", command=self.upload)
        self.load_data_button.grid(row=1, column=0)

        self.quit_button = Button(master, text='Quit', bg="black", fg="white", relief="ridge", height="1", width="10", command=self.quit)
        self.quit_button.grid(row=1, column=4, padx=10)

        #************ User Input ************
        self.freq_label = Label(master, text="Sample Frequency")
        self.freq_label.grid(row=2, column=0, sticky=E, padx=10)
        self.freq_entry = Entry(master, width="18")
        self.freq_entry.grid(row=2, column=1, padx=5)

        # self.threshold_label = Label(master, text="Threshold")
        # self.threshold_label.grid(row=3, column=0, padx=10)
        # self.threshold_entry = Entry(master, width="18")
        # self.threshold_entry.grid(row=3, column=1, padx=5)



        #self.button_1 = Button(master, text="nishat smells", command=lambda: self.message("count: "+ str(self.count)))
        #self.button_1.pack()


    def text_file_to_array(self, filename):
        arr = []
        try:
            inp = open(filename, "r")
            # read line into array
            for line in inp.readlines():
                # loop over the elements, split by whitespace
                for i in line.split():
                    # convert to integer and append to the list
                    arr.append(int(i))
            return arr
        except FileNotFoundError:
            print("File not found")
            exit()



    def butterworth_filter(self, orig_sig):
        b, a = signal.butter(6, 0.5, 'low')
        output_signal = signal.filtfilt(b, a, orig_sig)
        return output_signal


    def plot_graph(filtered, bpm):
        plt.plot(filtered, label='ECG Trace at' + bpm)
        plt.legend()
        return plt.show()

    def threshold(self, sig):
        #threshold_value = (max(sig)+min(sig)) / 2
        diff = max(sig) - min(sig)
        threshold_value = max(sig) - diff * 0.33
        return threshold_value


    def bpm_from_peak_finder(self, freq, sig, threshold):
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


    def sample_positions_to_time(self, freq, sig, threshold):
        positions = []
        for i in range(1, len(sig) - 2):
            if sig[i] > sig[i - 1] and sig[i] > sig[i + 1] and sig[i] > threshold:
                i = i/freq
                positions.append(i)
        return positions


    def average_differences(self, r_peak_times):
        diffs = np.diff(r_peak_times)
        avg_diffs = sum(diffs)/len(diffs)
        return avg_diffs


    def root_mean_square_differences(self, r_peak_times):
        square = []
        r_peak_diffs = np.diff(r_peak_times)
        for i in range(len(r_peak_diffs) - 2):
            r_peak_diffs[i] = r_peak_diffs[i] * r_peak_diffs[i]
            square.append(r_peak_diffs[i])
        sum_of_squares = sum(square)
        mean = sum_of_squares/len(square)
        rmssd = math.sqrt(mean)
        return rmssd


    def standard_dev_diffs(self, r_peak_times):
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


    def has_arrhythmia(self, SDRR):
        if SDRR > 15:
            print("Arrhythmia Detected!")

    def hrv(self, RMSSD):
        if RMSSD < 0.6:
            print("Arrhythmia Detected!")

    def arrhythmia_type(self, bpm):
        if bpm < 50:
            print("Bradycardia detected!")
        elif bpm > 100:
            print("Tachycardia detected!")

    def upload(self):
        filename = filedialog.askopenfilename()
        print('Selected:', filename)
        # file = open(root.filename).read()
        data = self.text_file_to_array(filename)
        filtered = self.butterworth_filter(data)
        threshold = self.threshold(filtered)
        bpm = self.bpm_from_peak_finder(int(self.freq_entry.get()), filtered, threshold)
        print("HeartRate = ", bpm, " bpm")
        self.arrhythmia_type(bpm)
        time = self.sample_positions_to_time(int(self.freq_entry.get()), filtered, threshold)
        SDRR = self.standard_dev_diffs(time)
        RMSSD = self.root_mean_square_differences(time)
        print("SDSD = ", SDRR, " seconds")
        print("RMSSD = ", RMSSD, " seconds")
        self.has_arrhythmia(SDRR)
        if bpm > 50:
            self.hrv(RMSSD)
            print("Heart rhythm is healthy")



    def quit(self):
        exit()

root = Tk()
GUI = Gui(root)
root.mainloop()




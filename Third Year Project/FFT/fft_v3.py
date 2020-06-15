import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from biosppy.signals import ecg
import math
dataset = pd.read_csv("test_new_1500_points.csv") #Read data from CSV datafile
plt.title("Heart Rate Signal") #The title of our plot
plt.plot(dataset) #Draw the plot object
plt.show() #Display the plot

# process it and plot
signal = np.loadtxt('test_new.txt')
out = ecg.ecg(signal=signal, sampling_rate=100, show=True)
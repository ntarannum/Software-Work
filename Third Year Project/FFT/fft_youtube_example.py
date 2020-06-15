from math import sin
from numpy.core.multiarray import arange, zeros
from numpy.core.umath import pi
from numpy.matlib import rand, randn

N = 10001
Nf = 3
t = arange(N, dtype=float)
#pick random periods between 10 and 2010 and convert them to frequencies
Ts = rand(Nf)*2000+10
fs = 1./Ts
#pick random amplitudes
amp = rand(Nf)*200+10
#pick random phases
phi = rand(Nf)*2*pi
#calculate signal
h = zeros(N)
for j in range(len(fs)):
    print("amp[{}] = {}".format(j,amp[j]))
    print("fs[{}] = {}".format(j,fs[j]))
    print("phi[{}] = {}".format(j,phi[j]))
    h += amp[j]*sin(2*pi*t*fs[j]+phi[j])
#make a noisy signal by adding white noise
#hn = h + randn(N)*3*h + randn(N)*700

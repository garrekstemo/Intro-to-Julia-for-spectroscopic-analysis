using FFTW
using GLMakie

fs = 1
t = 1:1/fs:3
N = length(t)

# Nyquist frequency
fn = fs / 2

f_k = 1 / (1 * 4)

k = 3 - 4
k / (4 * 1)

fftfreq(4, 1)

##
fig = Figure()
DataInspector()
ax = Axis(fig[1, 1])


fig
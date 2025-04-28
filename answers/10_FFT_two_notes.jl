using FFTW
using GLMakie

interferrogram(t, A_1, f_1, f_2) = A_1 * sin(2π * f_1 * t) + sin(2π * f_2 * t)

N = 2^20  # number of samples
Ts = 1 / (1.5 * N)  # sampling period
fs = 1 / Ts  # sampling rate
fn = fs / 2  # Nyquist frequency
D = N / fs  # duration of the signal in seconds
df = fs / N  # frequency resolution in Hz
t = 0:Ts:(D - Ts)

# Modify the interferrogram parameters
A_1 = 0.4
f_1 = 110
f_2 = 100
y = interferrogram.(t, A_1, f_1, f_2)

X = fftshift(fftfreq(length(t), fs))
Y = fftshift(abs.(fft(y)))


fig = Figure(size = (1000, 500))
DataInspector()
ax1 = Axis(fig[1, 1],
    title = "Interferrogram",
    ylabel = "Intensity",
    xlabel = "Time (s)",
)
lines!(t, y)

ax2 = Axis(fig[2, 1],
    title = "Spectrum",
    ylabel = "Intensity",
    xlabel = "Frequency (Hz)",
    xticks = LinearTicks(5),
)
lines!(X, Y)
xlims!(0, 130)
fig
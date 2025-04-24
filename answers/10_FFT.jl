using FFTW
using GLMakie

function damped_sine(t, f, τ)
    return sin(2π * f * t) * exp(-t / τ) 
end

f = 1.0
τ = 2.0
fs = 100

t = 0:1/fs:20
y = damped_sine.(t, f, τ) 

X = fftshift(fftfreq(length(t), fs))
Y = fftshift(abs.(fft(y)))


fig = Figure(size = (1000, 500))
ax1 = Axis(fig[1, 1],
    ylabel = "Amplitude",
    xlabel = "Time (s)",
)
lines!(t, y) 

ax2 = Axis(fig[1, 2],
    ylabel = "Amplitude",
    xlabel = "Frequency (Hz)",
)
lines!(X, Y)
xlims!(-3, 3)
fig
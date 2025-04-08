using GLMakie

x = 1:20

function decaying_damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

y = decaying_damped_sine.(x, 1, 0.1, 0.5)

fig = Figure()


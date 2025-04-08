# Prompt: Create a 3D plot of the electric potential of a dipole using Julia and Makie.jl
# This is qualitatively the answer students should get

using GLMakie

x = y = range(-1, 1, length=200)
a = 0.1
q = 1
ϕ(x, y) = q / (sqrt((x + a)^2 + y^2)) - q / (sqrt((x - a)^2 + y^2))
z = [ϕ(xi, yi) for xi in x, yi in y]

fig = Figure()
ax = Axis3(fig[1, 1], title = "Electric Potential of a Dipole", xlabel = "x", ylabel = "y", zlabel = "ϕ")
surface!(x, y, z)

fig

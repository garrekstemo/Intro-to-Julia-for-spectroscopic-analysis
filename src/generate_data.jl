using DelimitedFiles
using GLMakie
using LsqFit

function cavity_mode_energy(θs, E_0, n)
    E_c = zeros(length(θs))
    for i in eachindex(θs)
        E_c_i = E_0 / sqrt(1 - sin(θs[i])^2 / n^2)
        E_c[i] = E_c_i
    end
    return E_c
end

function polariton_branches(θs, E_v, E_0, n, Ω, branch = 1)
    E = zeros(length(θs))
    E_c = cavity_mode_energy(θs, E_0, n)

    if branch == 1
        for i in eachindex(θs)
            E_i = 0.5 * (E_v + E_c[i] - sqrt(Ω^2 + (E_c[i] - E_v)^2)) 
            E[i] = E_i
        end
    elseif branch == 2
        for i in eachindex(θs)
            E_i = 0.5 * (E_v + E_c[i] + sqrt(Ω^2 + (E_c[i] - E_v)^2))
            E[i] = E_i
        end
    end
    return E
end



# Generate fake data here by setting n, E_v, E_0, and Ω,
# which students must find by writing a fitting procedure.

E_v, E_0, n, Ω = [1953.7, 1900.1, 1.38, 94.5]
θs = range(0.0, 40, length = 10)
θsrad = collect(θs .* π/180.0)
LP = polariton_branches(θsrad, E_v, E_0, n, Ω, 1) .+ 1.3 * randn(length(θsrad))
UP = polariton_branches(θsrad, E_v, E_0, n, Ω, 2) .+ 3.7 * randn(length(θsrad))


function model(θsrad, p)
    E_v, E_0, n, Ω = p
    LP = polariton_branches(θsrad, E_v, E_0, n, Ω, 1)
    UP = polariton_branches(θsrad, E_v, E_0, n, Ω, 2)
    return vcat(LP, UP)
end

fit = curve_fit(model, θsrad, vcat(LP, UP), [E_v, E_0, n, Ω])


fig = Figure()
ax = Axis(fig[1, 1], xlabel = "Angle (°)", ylabel = "Frequency (cm⁻¹)", title = "Polariton branches")
scatter!(θs, UP, label = "UP")
scatter!(θs, LP, label = "LP")

θs_plot = range(0, 40, length = 100)
lines!(θs_plot, model(deg2rad.(θs_plot), fit.param)[1:length(θs_plot)], color = :gray)
lines!(θs_plot, model(deg2rad.(θs_plot), fit.param)[length(θs_plot)+1:end], color = :gray)

axislegend(ax, position = :lt)
fig

# save("images/polariton_fit.png", fig)
##
open("data/generated_polariton_data.csv", "w") do io
    writedlm(io, [θs LP UP], ',')
end
import PhysicalConstants.CODATA2022: ħ, e, c_0
using Unitful

"""
Equation 1 in Skolnick, 1998.
"""
function mirror_reflectivity(n_ext, n_c, n_L, n_H, N)
	1 - 4 * (n_ext / n_c) * (n_L / n_H)^(2 * N)
end

function dbr_reflectivity(no, ns, n1, n2, N)
    r = (no * n2^(2 * N) - ns * n1^(2 * N)) / (no * n2^(2 * N) + ns * n1^(2 * N))
    return r^2
end

function stopband(n1, n2)
    4 * asin(abs(n2 - n1) / (n2 + n1)) / π
end

eV = e * u"J / C"

λ0 = 630e-9u"m"
n_L = 1.46
# n_L = 2.1
n_H = 2.39
L_c = 1e-6u"m"
R = dbr_reflectivity(1, 1, n_L, n_H, 8)
R_cav = mirror_reflectivity(1, 1, n_L, n_H, 2)
sb = stopband(n_L, n_H)

L_dbr = λ0 * n_H * n_L / (2 * (n_H - n_L))
L_eff = L_c + L_dbr
Δc = ħ * c_0 * (1 - R) / (L_eff) / eV
τ = ħ / (Δc * e)
Q = ħ * c_0 / (λ0) / eV / Δc

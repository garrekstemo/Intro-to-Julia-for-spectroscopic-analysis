import PhysicalConstants.CODATA2022: ħ, e
using Unitful

"""
Equation 1 in Skolnick, 1998.
"""
function cavity_reflectivity(n_ext, n_c, n_L, n_H, N)
	1 - 4 * (n_ext / n_c) * (n_L / n_H)^(2 * N)
end

function dbr_reflectivity(no, ns, n1, n2, N)
    r = (no * n2^(2 * N) - ns * n1^(2 * N)) / (no * n2^(2 * N) + ns * n1^(2 * N))
    return r^2
end

function stopband(n1, n2)
    4 * asin(abs(n2 - n1) / (n2 + n1)) / π
end

λ0 = 630
n_L = 1.46
n_H = 2.13
L_c = 1e3

R = dbr_reflectivity(1, 1, 1.46, 2.13, 10)

L_dbr = λ0 * n_H * n_L / (2 * (n_H - n_L))

L_eff = L_c + L_dbr

Δc = ħ * 3e8 * (1 - R) / (L_eff * 1e-9) / e

τ = ħ / (Δc * J)

Q = ħ * 3e8 / (λ0 * 1e-9) / J / Δc
function nth_odd(x)
    2 * x - 1
end

using Test
@test nth_odd(1) == 1
@test nth_odd(5) == 9
@test nth_odd(19) == 37
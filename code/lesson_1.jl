# Blank for practice in the basic programming lesson
using Test

function f(x)
    2 * x - 1
end

@test f(1) == 1
@test f(2) == 3
@test f(3) == 5
@test f(4) == 7
@test f(5) == 9
@test f(19) == 37
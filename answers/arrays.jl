using Test

function rotate(v, n)
    k = length(v) - n % length(v) + 1
    vcat(v[k:end], v[1:k-1])
end

@test rotate([1, 2, 3], 1) == [3, 1, 2]
@test rotate([1, 2, 3], 2) == [2, 3, 1]
@test rotate([1, 2, 3, 4, 5], 8) == [3, 4, 5, 1, 2]


# Set every other number to zero
v = [i for i in 1:10]
v[2:2:end] = zeros(Int, length(v)÷2)
v



[x for x in 1:100 if x % 7 == 0]

mystring = "hello world"
vowels = ['a', 'e', 'i', 'o', 'u']
[letter for letter in mystring if letter in vowels]
# Programming basics in Julia

This lesson is a overview of basic programming concepts using the Julia language and the REPL.
The intended audience is people who have never programmed before, or who have only done a little programming in another language.

Goals
1. Download and install Julia and Visual Studio Code
2. Learn the basics of programming in Julia in the REPL (variables, if / else, loops)
3. Find help in the Julia documentation and on the internet


## Install Julia and Visual Studio Code
1. Download the latest version of Julia from the [official website](https://julialang.org/downloads/).
2. Follow the installation instructions for your operating system.
3. Download and install [Visual Studio Code](https://code.visualstudio.com/).
4. Install the Julia extension for Visual Studio Code by searching for "Julia" in the [Extensions Marketplace](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia).
5. Open the REPL in the terminal by typing `julia` and pressing Enter. This will open the Julia REPL, where you can run Julia code interactively.


## Addition, subtraction, multiplication, division
Open the REPL (the command line interface for Julia) by typing `julia` in the terminal.
REPL stands for Read-Eval-Print Loop.


### Basic operations and variable assignment
Follow along with the code examples below in the REPL.
Equals sign `=` is used for assignment, not equality.
Feel free to adapt the code based on student feedback and progression.
Remember to ask students to try things out themselves and play with the code.
Use the question "What do you think will happen?" to encourage them to think about the code before running it. Also a useful way of thinking about their optics setups later.

Start simple with basic arithmetic on one variable.
```
julia> a = 2  # assignment
2

julia> a  # print the value of a
2

julia> a + 1  # addition
3

julia> a - 1  # subtraction
1

julia> a * 2  # multiplication
4

julia> a^2  # exponentiation
4

julia> a / 2  # division
1.0  # what's going on here?

julia> a = 5  # reassign a

julia> a
5

julia> a + 1
6

julia> a += 1  # increment a by 1
6

julia> a
6

julia> a -= 1  # decrement a by 1
5

julia> a *= 2  # multiply a by 2
10

julia> a /= 2  # divide a by 2
5.0  # once again, the type has changed
```


### Variables and types
Now let's create some variables of different types and explore Julia's type system.

```
julia> a = 1
1

julia> b = 2.0
2.0

julia> c = 3.0 + 4.0im
3.0 + 4.0im

julia> d = "hello"
"hello"

julia> e = 'a'
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)

julia> typeof(a)
Int64

julia> typeof(b)
Float64

julia> typeof(c)
ComplexF64 (alias for Complex{Float64})

julia> typeof(d)
String
```

#### Questions
- What happens when you type `a = hello`? (no quotes)
    - What is the meaning of the single and double quotes?
- What happens if you try to multiply a string by a number? Read the error message.
    - Can you generate other error messages?
- How do you repeat a string 3 times?


Now let's do some basic operations with these variables.
```
julia> a + b
3.0

julia> a * b
2.0

julia> a / b
0.5

julia> a^2
1

julia> a + b * c
7.0 + 8.0im
```

How does Julia handle the resulting type?

Playing with strings
```
julia> d^3
"hellohellohello"

julia> d = "hello "
"hello "

julia> d^3
"hello hello hello "
```

### Arrays and collections
Arrays are a collection of elements, usually of the same type.

```
julia> v = [1, 2, 3]  # array of integers
3-element Vector{Int64}:
 1
 2
 3

julia> w = [1.0, 2.0, 3.0]  # array of floats
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> w = [1, 2.0, 3]  # the mixed array gets converted to Float64 because of the type promotion rules in Julia
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> a = ["hello", 2.0, 3]  # mixed array has type Any
3-element Vector{Any}:
  "hello"
  2.0
  3
```

Notice that these arrays are of type `Vector{Int64}`, `Vector{Float64}`, and `Vector{Any}`.
The type `Vector` is a one-dimensional array in Julia. It is a subtype of `Array`.

```
julia> typeof(v)
Vector{Int64} (alias for Array{Int64, 1})

julia> typeof(w)
Vector{Float64} (alias for Array{Float64, 1})
```

#### Indexing
You can access elements of an array using indexing.

```
julia> a[1]  # indexing starts at 1, not 0
"hello"

julia> a[2]
2.0

julia> a[3]
3

julia> a[1] = 1  # you can change the value of an element in the array
1

julia> a
3-element Vector{Any}:
 1
 2.0
 3
```
The length of a vector can be obtained using the `length` function.

```
julia> length(a)
3
```

#### Matrices
Matrices are two-dimensional arrays in Julia. You can create a matrix using the `reshape` function or by using semicolons to separate rows.

```
julia> A = [1 2 3; 4 5 6; 7 8 9]  # matrix with semicolons
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9

julia> B = reshape(1:9, 3, 3)  # matrix with reshape
3×3 reshape(::UnitRange{Int64}, 3, 3) with eltype Int64:
 1  4  7
 2  5  8
 3  6  9

julia> A[1, 2]  # indexing a matrix
2

julia> A[2, 3]
6

julia> A[1, :]  # all elements in the first row
3-element Vector{Int64}:
 1
 2
 3

julia> A[:, 1]  # all elements in the first column
3-element Vector{Int64}:
 1
 4
 7
```
You can also use the `size` function to get the dimensions of a matrix.

```
julia> size(A)
(3, 3)
julia> size(B)
(3, 3)
```

### Matrix and vector operations
You can perform various operations on matrices and vectors, such as addition, subtraction, multiplication, and division.

```
julia> A + B  # matrix addition
3×3 Matrix{Int64}:
  2   6  10
  6  10  14
 10  14  18

julia> A - B  # matrix subtraction
3×3 Matrix{Int64}:
 0  -2  -4
 2   0  -2
 4   2   0

julia> A * B  # matrix multiplication
3×3 Matrix{Int64}:
 14   32   50
 32   77  122
 50  122  194

julia> A / B  # matrix division
3×3 Matrix{Float64}:
 -0.333333   0.666667  -0.0
  2.26667   -7.53333    5.6
 -6.33333    6.66667   -0.0

julia> A'  # transpose of a matrix
3×3 adjoint(::Matrix{Int64}) with eltype Int64:
 1  4  7
 2  5  8
 3  6  9

julia> A * v  # matrix-vector multiplication. What do you think will happen?
3-element Vector{Int64}:
 14.0
 32.0
 50.0

julia> v * A  # what do you think will happen?
```
You can also perform element-wise operations using the `.*`, `./`, and `.^` operators.

```
julia> A .* B  # element-wise multiplication
3×3 Matrix{Int64}:
  1   8  21
  8  25  48
 21  48  81
```
There are more linear algebra operations available if you use the `LinearAlgebra` package.



## Resources

- [Official Julia Documentation](https://docs.julialang.org/)
- [Julia tutorials list](https://julialang.org/learning/tutorials/)
- [The Julia WikiBook](https://en.wikibooks.org/wiki/Introducing_Julia)
- [The Julia Express](https://ucidatascienceinitiative.github.io/IntroToJulia/)

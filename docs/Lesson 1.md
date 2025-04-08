# 1. Programming basics in Julia

This lesson is a overview of basic programming concepts using the Julia language and the REPL.
The intended audience is people who have never programmed before, or who have only done a little programming in another language.

Goals
1. Download and install Julia and Visual Studio Code
2. Learn the basics of programming using Julia in the REPL (variables, types, basic operations, booleans, and arrays)
3. Find help in the Julia documentation and on the internet


## Install Julia and Visual Studio Code
1. Download the latest version of Julia from the [official website](https://julialang.org/downloads/).
2. Follow the installation instructions for your operating system.
3. Download and install [Visual Studio Code](https://code.visualstudio.com/).
4. Install the Julia extension for Visual Studio Code by searching for "Julia" in the [Extensions Marketplace](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia).
5. Quit Visual Studio Code for now and open the terminal (command line interface) on your computer.

We will use the Julia REPL (Read-Eval-Print Loop) in the terminal for this lesson, not VS Code.
VS Code will be used in the next lesson. Here we just install it.


## Variables, basic operations, and types
Open the REPL (the command line interface for Julia) by typing `julia` in the terminal.
REPL stands for Read-Eval-Print Loop.

### Basic operations and variable assignment
Follow along with the code examples below in the REPL.
Equals sign `=` is used for assignment, not equality.
Feel free to adapt the code based on student feedback and progression.
Remember to ask students to try things out themselves and play with the code.
Use the question, "What do you think will happen?" to encourage students to think about the code before running it. Also a useful way of thinking about their optics setups later.

Start with basic operations on one variable.
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

julia> a = a + 1  # reassign a using itself
6

julia> a = 5  # reassign a again
5

julia> a += 1  # increment a by 1. This is a shorthand for a = a + 1
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


### Basic types
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

### Questions
1. What happens when you type `a = hello` (no quotes)? What is the meaning of the single and double quotes?
2. What happens if you try to multiply a string by a number? Read the error message.
3. Can you generate other error messages?
4. How do you repeat a string 3 times?
5. Check what `typeof` does by typing `?typeof` in the REPL.


### Playing with strings
```
julia> d = "hello"
"hello"

julia> d * d  # string concatenation
"hellohello"

julia> d^3
"hellohellohello"

julia> d = "hello "
"hello "

julia> d^3
"hello hello hello "
```

### Logical operators
Logical operators are used to perform logical operations on boolean values.
Booleans are a type that can be either `true` or `false`.

```
julia> t = true
true

julia> f = false
false

julia> t && f  # logical AND
false

julia> t || f  # logical OR
true

julia> !t  # logical NOT
false

julia> t == f  # equality
false

julia> t != f  # inequality
true

julia> t === f  # strict equality
false

julia> t !== f  # strict inequality
true
```
Try this by assigning numerical values to a and b (e.g. a = 1, b = 1.0).


### Comparison operators
Comparison operators are used to compare values.

```
julia> a = 1
1

julia> b = 2
2

julia> a < b  # less than
true

julia> a <= b  # less than or equal to
true

julia> a > b  # greater than
false

julia> a >= b  # greater than or equal to
false

julia> a == b  # equal to
false

julia> a != b  # not equal to
true
```

### Questions
1. Check how to use the funciton `isa` by typing `?isa` in the REPL.
2. Use `isa` to check the type of `a`, and `b`. What does it return?
3. What type `isa`? How can you check this?
4. What is the difference between `==` and `===`?


## Arrays
Arrays are a collection of elements, usually of the same type but not always.

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

#### Questions
1. Try comparing arrays `v` and `w` using the comparison operators.
1. What is the output of `v isa Array`?


### Indexing arrays
You can access elements of an array using indexing.
Julia uses 1-based indexing, which means that the first element of an array is at index 1, not 0.

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


### Matrices
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

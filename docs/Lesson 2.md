# 2. Functions and control flow

This lesson introduces students to Visual Studio Code. But first, the concept of files and folders are reviewed.
Students create a project folder to store their tutorial files and future experiment code.
This ensures consistent data storage and analysis practices in the lab.
We also cover environments and how to create a new environment for each project.
This is important for reproducibility and to avoid package conflicts.

The main part of the lesson will cover some built-in Julia functions, user-defined functions, for-loops, and if-statements.


## Files and folders on a computer
On a computer, files are stored in folders (directories), where a folder can contain both files and other folders.
We want to store files and folders in a way that makes it easy to find and organize them.
It is important in science to have well-organized data and code for reproducibility.

Follow these steps to create a project folder for your tutorials and experiments:
1. On Windows go to `C:\Users\<username>\Documents\` and create a new folder called `projects`. This is where you will store your projects while you are in the lab. On macOS, go to `~/Documents/` and create a new folder called `projects`.

2. Inside of `projects`, create a new folder called `tutorials`. This is where you will store code for these tutorials.

3. In `tutorials`, create a folder called `intro to programming` or something similar.

4. Open Visual Studio Code and open the `tutorials` folder that you just created.

5. Create a new file called `lesson2.jl` in the `intro to programming` folder. This is where you will write your code for this lesson.

Next we will create a new environment for this project.


## Environments
In Julia, an environment is a collection of packages and their versions that are used for a specific project.
This is important for reproducibility and to avoid package conflicts.

To create a new environment, follow these steps:
1. Open the Julia REPL in Visual Studio Code via the Command Palette (Ctrl+Shift+P) and type `Julia: Start REPL`.
2. In the REPL, type `]` to enter the package manager. (Hit backspace to exit the package manager and return to the Julia REPL.)
3. Type `activate .` to create a new environment in the current folder.

Notice that a `Project.toml` file and a `Manifest.toml` file were created in your project folder.
These files contain information about the packages and their versions that are used in this environment.

When Makie has finished installing and compiling, let's go back to the REPL in VS Code and learn about functions.


## Simple functions
Functions in programming operate similarly to mathematical functions.
They take inputs (arguments) and produce outputs (return values).
Julia has many built-in functions, and you can also define your own functions.
Examples: `sin`, `cos`, `exp`, `log`, `sqrt`, `abs`, `round`, `floor`, `ceil`, `max`, `min`.

Play around with these functions in the REPL. \
(To instructor: you don't have to do all of the below examples. They are just to show the variety of built-in functions available.)

```julia
julia> sin(0)
0.0

julia> cos(0)
1.0

julia> exp(0)
1.0

julia> log(1)
0.0

julia> sqrt(4)
2.0

julia> abs(-5)
5

julia> round(3.14159, digits=2)  # This function has two arguments (inputs).
3.14

julia> floor(3.14159)
3.0

julia> ceil(3.14159)
4.0

julia> max(3, 5)
5

julia> min(3, 5)
3
```

Let's define a simple function that takes one argument and returns the square of that argument.
```julia
julia> square(x) = x^2  # function definition
square (generic function with 1 method)

julia> square(3)
9

julia> square(4.0)
16.0

julia> square(4.0 + 2.0im)
12.0 + 16.0im
```

You can see that the function automatically works with different types of inputs.
This is one of the powerful features of Julia: it can automatically determine the type of the input and return the appropriate type for the output.
This is allowed because of Julia's "multiple dispatch" functionality and is a key feature of Julia's design.


## Broadcasting
Broadcasting allows you to apply a function to each element of an array or collection.
You can use the dot `.` operator to indicate that you want to apply a function element-wise.

```julia
julia> f(x) = 1 + x
f (generic function with 1 method)

julia> f(1)
2

julia> f(1.0)
2.0
```

What happens if we try to apply this function to a vector?
```julia
julia> v = [1, 2, 3]
3-element Vector{Int64}:
 1
 2
 3

julia> f(v)
ERROR: MethodError: no method matching +(::Int64, ::Vector{Float64})
For element-wise addition, use broadcasting with dot syntax: scalar .+ array
The function `+` exists, but no method is defined for this combination of argument types.

Closest candidates are:
  +(::Any, ::Any, ::Any, ::Any...)
   @ Base operators.jl:596
  +(::Real, ::Complex{Bool})
   @ Base complex.jl:322
  +(::Array, ::Array...)
   @ Base arraymath.jl:12
  ...

Stacktrace:
 [1] f(x::Vector{Float64})
   @ Main ./REPL[95]:1
 [2] top-level scope
   @ REPL[99]:1
```
The error message is telling us that the function `+` does not know how to add a scalar to a vector.
To fix this, we can use broadcasting with [dot syntax](https://docs.julialang.org/en/v1/manual/functions/#man-vectorized). This is also known as "element-wise" operations, "vectorized" operations, or "broadcasting".

```julia
julia> f.(v)  # apply f to each element of v
3-element Vector{Int64}:
 2
 3
 4
```

You can also use broadcasting with other functions.

```julia
julia> sin.(v)  # apply sin to each element of v
3-element Vector{Float64}:
 0.8414709848078965
 0.9092974268256817
 0.1411200080598672
```

It is also possible to define a function that takes a vector as input and returns a vector as output.

```julia
julia> f(x) = x .+ 1  # broadcasting with dot operator
f (generic function with 1 method)
julia> f(v)
3-element Vector{Int64}:
 2
 3
 4
 ```

or using the `@.` macro

```julia
julia> @. f(x) = x + 1  # broadcasting with @. macro
f (generic function with 1 method)
julia> f(v)
3-element Vector{Int64}:
 2
 3
 4
```


## Control flow
Control flow statements allow you to control the flow of execution in your code.
This includes `if` statements, `for` loops, and `while` loops.
### If statements
If statements allow you to execute code conditionally based on a boolean expression.

```julia
x = 5
if x > 0
    println("x is positive")
elseif x < 0
    println("x is negative")
else
    println("x is zero")
end

# output: x is positive
```

Now change the value of `x` to a negative number and run the code again.


What happens if you don't include the `end` statement?

### Loops
Now let's make a loop that prints the numbers from 1 to 10.

```julia
for i in 1:10
    println(i)
end
```

There are also `while` loops, which execute code while a condition is true.

```julia
i = 1
while i <= 10
    println(i)
    i += 1
end
```

## Functions with multiple arguments
It is more efficient in Julia to put code inside of functions.
This allows you to reuse code and avoid writing the same code over and over.
You can define functions with multiple arguments by separating the arguments with commas.

```julia
function add(x, y)
        return x + y
    end

add(1, 2)  # 3
```

Let's package an if statement and a for loop inside a function.

```julia
function print_numbers(n)
    for i in 1:n
        if i % 2 == 0
            println("$i is even")
        else
            println("$i is odd")
        end
    end
end

print_numbers(10)
```

This would have been tedious to write in the REPL.


## Project
1. Write a function `is_prime()` that takes an integer as input and returns `true` if the number is prime and `false` otherwise.
2. Write another function `print_primes()` that takes an integer as input and prints all the prime numbers from 1 to that integer.
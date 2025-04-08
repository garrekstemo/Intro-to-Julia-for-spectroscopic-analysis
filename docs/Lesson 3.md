# 3. Read/write and plotting

Goals:
1. Learn how to read and write data files in Julia.
2. Plot data using the Makie.jl package.

Close and reopen VS Code to start a new session.
Open your tutorial folder in VS Code and check that the environment (Julia env in the bottom left corner) is set to the current directory.

## Starting a new project
We will use the Makie.jl package to plot data, so we have to install it first.

First, show students the Makie website and explain the three different backends:
- GLMakie for GPU-accelerated plotting
- CairoMakie for high-quality vector graphics
- WGLMakie for web-based plotting

We will use GLMakie for this tutorial, but you can use any of the backends.

1. Open the Julia REPL in VS Code via the Command Palette (Ctrl+Shift+P) and type `Julia: Start REPL`.
2. In the REPL, type `]` to enter the package manager. (Hit backspace to exit the package manager and return to the Julia REPL.)
3. Check that the current environment is set to the current directory. If not, type `activate .` to create a new environment in the current folder.
4. Type `add Makie` to install the Makie.jl package.
5. Make a new file called `plotting.jl` in your tutorial folder.
6. Type `using GLMakie` at the top load the package.


## Make a simple plot with GLMakie
First define a function. We will write a decaying damped sine wave function.

```julia
function damped_sine_wave(x, A, ω, φ, τ)
    return A * exp(-x / τ) * sin(ω * x + φ)
end
```


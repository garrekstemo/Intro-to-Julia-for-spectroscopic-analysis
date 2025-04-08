# 3. Plotting

Close and reopen VS Code to start a new session.
Open your tutorial folder in VS Code and check that the environment (Julia env in the bottom left corner) is set to the current directory.

Everyone should check out the official [Makie tutorials](https://docs.makie.org/stable/tutorials/getting-started) on their own.


## Starting a new project
We will use the Makie.jl package to plot data, so we have to install it first.

First, show the Makie website and explain the three different backends:
- GLMakie for GPU-accelerated plotting
- CairoMakie for high-quality vector graphics
- WGLMakie for web-based plotting

We will use GLMakie for this tutorial, but you can use any of the backends.

1. Open the Julia REPL in VS Code via the Command Palette (Cmd+Shift+P on macOS) (Ctrl+Shift+P on Windows) and type `Julia: Start REPL`.
2. In the REPL, type `]` to enter the package manager. (Hit backspace to exit the package manager and return to the Julia REPL.)
3. Check that the current environment is set to the current directory. If not, type `activate .` to create a new environment in the current folder.
4. Type `add Makie` to install the Makie.jl package.
5. Make a new file called `plotting.jl` in your tutorial folder.
6. Type `using GLMakie` at the top load the package.


## Create a function and generate data
First define a function. We will write a decaying damped sine wave function.

```julia
function damped_sine_wave(x, A, f, τ)
    return A * exp(-x / τ) * sin(2π * f * x)
end
```

Then we will generate the data.
Start with the following values

```julia
A = 1.0  # amplitude
f = 0.1  # frequency in Hz
τ = 0.5  # decay time constant in seconds
```

Create the x values. There are two ways to do this:
1. Use the `range` function to create a range of values.

```julia
x = range(0, stop=10, length=100)
```

Type `?range` in the REPL to see the documentation for the `range` function.

2. The other way is to use the range operator `:` to create a range of values.

```julia
x = 0:10
```

Let's use the range operator here. Type `?:` in the REPL to see the documentation for the range operator. Set the range from 0 to 10 with an appropriate step size.

Then generate the y values and store them in a variable called `y`.

```julia
y = damped_sine_wave.(x, A, f, τ)
```
Notice that we used the dot operator `.` to apply the function to each element of the array `x`.
Defining a function for a single value and then using the dot operator to apply it to an array makes the code cleaner, easier to read, and more flexible to use.


## How Makie works
Makie uses a "scene" to create a plot, and you can add layers to the scene.
First let's make a figure and see what it looks like.

```julia
using GLMakie
fig = Figure()
fig
```

Hit `alt+enter` to run all of the code in this file. You should see a blank figure window pop up.
Think of the figure as a blank canvas. You can add layers to the figure to create a plot.
We can do this by adding an `Axis` to the figure.

```julia
ax = Axis(fig[1, 1])
```

This creates a new axis in the figure.
The `Axis` function has many options to customize the plot, such as the title, labels, and limits.
Let's make another `Axis` in the first row and second column of the figure.

```julia
ax2 = Axis(fig[1, 2])
```

You can find more details about figure layout in the Makie documentation.
For now, delete the second axis.

Make a line plot of the data using the `lines!` function.

```julia
scatter!(x, y)
```

The exclamation mark `!` at the end of the function name indicates that this function modifies the existing plot rather than creating a new one.
Adjust the function parameters and x interval to see how the plot changes.

## Commenting and working in sections in VS Code
By now you know that you can evaluate a single line of code by placing the cursor on the line and hitting `shift+enter`.
You can also evaluate the entire file by pressing `alt+enter`.

It's common to also leave comments in the code to explain what the code does.
You can add comments by starting a line with `#` or by adding `#` at the end of a line.
For example, you can add a comment to the end of the line that creates the figure:

```julia
fig = Figure()  # Create a new figure
```

Docstrings are also a good way to document your code.
These are often used to describe the purpose of a function and its parameters.
Let's add a docstring to the `damped_sine_wave` function.

```julia
"""
    damped_sine_wave(x, A, f, τ)
Generate a damped sine wave.
# Arguments
- `x`: The x values.
- `A`: The amplitude.
- `f`: The frequency in Hz.
- `τ`: The decay time constant in seconds.
"""
function damped_sine_wave(x, A, f, τ)
    return A * exp(-x / τ) * sin(2π * f * x)
end
```

Let's add a comment just above assignment of `x` and `y` values.

```julia
# Generate the x and y values
x = 0:0.1:10
y = damped_sine_wave.(x, A, f, τ)
```

Sometimes you want to evaluate only a section of the code.
For example, you might want to evaluate the code that generates the data and the code that creates the plot separately.
You can separate chunks of code by adding `##` at the beginning of line.
Then hitting `alt+enter` will evaluate the code in that section (between two `##` lines, or from the beginning of the file to the first `##` or from the last `##` to the end of the file).
Try this by separating the code that generates the data and the code that creates the plot into two sections.


## Saving the plot
You can save the plot to a file using the `save` function.
But first, let's make this data look a bit more realistic by adding some noise.

```julia
# Add some noise to the data
noise = 0.1 * randn(length(x))
y_noisy = y .+ noise
```

Now let's plot the noisy data.

```julia
scatter!(x, y_noisy)
```

You can save the plot to a file using the `save` function.
Save this plot to a file called `damped_sine_wave.png` in a new folder called `output` in your tutorial folder.

```julia
save("output/damped_sine_wave.png", fig)
```

Notice that the plot no longer appears in the window.
You can comment out the `save` line to see the plot again.
A convenient way to comment out a line is to select the line and hit `cmd+/` (or `ctrl+/` on Windows).
Hit `cmd+/` (`ctrol+/`) again to uncomment the line.


## Activity
Visualize the potential of two point charges with surface plot in 3D.
You will need to look up the equation for the potential of a point charge in Cartesian coordinates and how to create a surface plot in Makie.

q+ at (-a, 0) and q- at (+a, 0)

$$\phi(x, y) = \frac{q}{4\pi\epsilon_0} \left( \frac{1}{\sqrt{(x+a)^2+y^2}} - \frac{1}{\sqrt{(x-a)^2+y^2}} \right)$$

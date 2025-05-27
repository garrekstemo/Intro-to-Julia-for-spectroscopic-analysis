# Introduction to Julia for Spectroscopy

Made with Julia version: 1.11.5

This short course is designed to introduce students to the Julia programming language applied to analysis for spectroscopy.
It is intended for students who have never programmed before, or who have only done a little programming in another language.
The goal is to teach the basics of programming in Julia, and to provide examples of how to use Julia for data analysis and visualization in spectroscopy.
These lessons were not originally intended to be comprehensive, but they have evolved into somewhat of a complete introduction to programming.
They should serve as a starting point for students to learn how to use Julia for their own research projects in experimental spectroscopy.


## How this repository is organized
Lessons include short exercises to be done in class, and longer problems to be done outside of class.
These are organized by chapter in the `chapters` directory.
The code that generates the figures are in the `generate_images` directory.
Answers to the exercises and problems are in a separate repository, which is not included here.

Data needed for the exercises and problems is included in the `data` directory.

The `src` directory contains scripts that generate data for activites, as well as a script that generates a pdf file from the markdown chapters.
This directory needs to be cleaned up a bit....


## Experiments
The corresponding experimental tutorials can be found at the [Optics Tutorials](https://github.com/garrekstemo/Optics-Tutorials) repository.
The computer science tutorial is designed to set students up to analyze data obtained during the optics tutorials.


## Recommended pace

Chapters 1 through 6 cover programming fundamentals.
These should ideally be covered in two weeks with about 1 hour of class time per chapter, and 2-3 hours of homework per week.

Chapters 7 through 10 cover data analysis and visualization.
These can be covered in about a week, maybe a little more depending on how much detail is spent on each chapter.


### Example schedule

#### Week 1
| Day | Chapter | Topics |
|-----|---------|--------|
| Monday   | Ch 1: Introduction to Julia | Installation, files, folders, and environments  |
| Wednesday   | Ch 2: Variables, operators, and types | Variables, basic operations, types, and strings |
| Friday   | Ch 3: Conditionals | Boolean expressions, comparison operators, logic, and if/else statements |

#### Week 2
| Day | Chapter | Topics |
|-----|---------|--------|
| Monday   | Ch 4: Iteration | While and For loops |
| Wednesday   | Ch 5: Functions | Built-in functions, user-defined functions, assignment form |
| Friday   | Ch 6: Arrays | Indexing, slicing, range objects, multi-dimensional arrays, manipulating arrays, broadcasting, and comprehensions |

#### Week 3
| Day | Chapter | Topics |
|-----|---------|--------|
| Monday   | Review Ch 1-6 | Variables, conditionals, iteration, arrays, functions |
| Wednesday   | Ch: 7 Plotting | Basic plotting with Makie.jl |
| Friday   | Ch 8: Basic Fitting | Least squares fitting with LsqFit.jl |

#### Week 4
| Day | Chapter | Topics |
|-----|---------|--------|
| Monday   | Ch 9: Optimization | Apply least squares fitting to a more complex problem |
| Wednesday  | Ch 10: Fourier Transforms | FT basics and Fourier transforms with FFTW.jl |
| Friday  | Review Ch 7-10 | Plotting, fitting, Fourier transforms |

# Introduction to Julia for spectroscopy

Made with Julia version: 1.11.5

This tutorial is designed to introduce students to the Julia programming language applied to analysis for spectroscopy.
It is intended for students who have never programmed before, or who have only done a little programming in another language.
The goal is to teach the basics of programming in Julia, and to provide examples of how to use Julia for data analysis and visualization in spectroscopy.
These lessons were not originally intended to be comprehensive, but they have evolved into nearly a complete introduction to computer science.
They should serve as a starting point for students to learn how to use Julia for their own research projects in experimental spectroscopy.


## How this repository is organized
Lessons include short exercises to be done in class, and longer problems to be done outside of class.
These are organized by chapter in the `chapters` directory.
Solutions to the exercises and problems, along with the code that generates the figures, are included in the `answers` directory.

Data needed for the exercises and problems is included in the `data` directory.

The `src` directory contains scripts that generate data for activites, as well as a script that generates a pdf file from the markdown chapters.
This directory needs to be cleaned up a bit....


## Experiments
The corresponding experimental tutorials can be found at the [Optics Tutorials](https://github.com/garrekstemo/Optics-Tutorials) repository.
The computer science tutorial is designed to set students up to analyze data obtained during the optics tutorials.


## Why Julia?
There are a lot of software options that can be used to analyze data.
Why even learn a programming language?
First, programming languages are much more powerful than GUI based programs or spreadsheets.
They allow you to automate repetitive tasks, and to write code that can be reused in different contexts.
They also allow custom analytical solutions to be developed, and to be shared with others.
Programming languages are also much more flexible than GUI based programs or spreadsheets.
I choose the Julia programming language in particular for several reasons:

1. It was designed numerical and scientific computing from the start and has a robust collection of scientific libraries.
2. It is easy to learn, borrowing good ideas from Python, Lisp, and others.
3. It is responsive and interactive. It can be used in Jupyter notebooks or in the REPL (Read Evaluate Print Loop) in the command line. The VS Code extension for Julia also provides an interactive environment for writing and running code.
4. It uses modern technologies (JIT and LLVM) and was designed for performance from the start. It is fast, comparable to C or Fortran. So if performance is your goal, you can stick with Julia and do not need to learn a second language.
5. Scientific software can be very expensive. Julia is free, open source, and has a [helpful community](https://discourse.julialang.org).
6. Reproducibiliy is a priority, and Julia has a built-in package management system that makes it easy to share code and reproduce results. This is essential when designing code for science.
7. I was sold on the excellent plotting library, Makie.jl. It is fast, interactive, and has a clean API.

# Introduction to Julia for spectroscopy

Made with Julia version: 1.11.4

This tutorial is designed to introduce students to the Julia programming language and its applications in spectroscopy.
Lessons are more like lecture notes.
It is intended for students who have never programmed before, or who have only done a little programming in another language. The goal is to teach the basics of programming in Julia, and to provide examples of how to use Julia for data analysis and visualization in spectroscopy.
These lessons were not originally intended to be comprehensive, but they have evolved into nearly a full introduction to programming for non-programmers.
They should serve as a starting point for students to learn how to use Julia for their own research projects in experimental spectroscopy.


## Lessons and exercises
The lessons are organized in the `chapters` folder and corresponding coding exercises are tested in the `code` folder.


## Input and Output
Students should save raw data in the `data` directory.
Output, such as processed data and figures, should be saved to the `output` directory.


## src
The `src` directory contains scripts that generate data for activites.


## Corresponding experiments
The corresponding experimental tutorials can be found at the [Optics Tutorials](https://github.com/garrekstemo/Optics-Tutorials) repository.
These programming tutorials are designed to set students up to analyze data obtained during the optics tutorials.


## Why Julia?
Any software can of course be used to analyze data, but I choose Julia for a few reasons.

1. It is designed specifically for scientific applications and has many robust scientific libraries.
2. It is easy to learn, borrowing good ideas from Python and Matlab.
3. It is responsive and interactive. It can be used in Jupyter notebooks or in the REPL (Read Evaluate Print Loop) in the command line. The VS Code extension for Julia also provides an interactive environment for writing and running Julia code.
4. It is fast, comparable to C or Fortran. So if performance is your goal, you can stick with Julia and do not need to learn a second language.
5. It is free, open source, and has a large and growing community. A modern, free, powerful, and simple programming language with a great selection of packages is a tremendous asset for any lab.
6. Reproducibiliy is a priority, and Julia has a built-in package management system that makes it easy to share code and reproduce results. This is essential when designing code for science.
7. I was sold on the excellent plotting library, Makie.jl. It is fast, interactive, and has a clean API.

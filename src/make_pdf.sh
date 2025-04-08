#!/bin/zsh

filename="Introduction to Programming with Julia.pdf"

pandoc ../docs/*.md -f markdown+tex_math_dollars --pdf-engine=lualatex \
    -V geometry:margin=1in \
    -V mainfont="Libertinus Serif" \
    -V mathfont="Libertinus Math" \
    -V monofont="DejaVu Sans Mono" \
    -V colorlinks=true \
    --toc \
    -o "../docs/$filename"
cd ../docs
echo "PDF created at $PWD/$filename"
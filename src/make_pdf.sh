#!/bin/zsh

filename="Introduction to Programming with Julia.pdf"

pandoc ../docs/*.md -f commonmark --pdf-engine=lualatex \
    -V colorlinks=true \
    -V mainfont="Helvetica" \
    --toc \
    -o "../docs/$filename"
cd ../docs
echo "PDF created at $PWD/$filename"
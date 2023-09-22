#!/bin/bash

# The working directory is under the root directory!

if [[ $1 = "f1" ]]; then
    cmake -B build -S . \
        -G Ninja\
        -DCMAKE_BUILD_TYPE=Debug\
        -DCMAKE_EXPORT_COMPILE_COMMANDS=on
fi

if [[ $1 = "f2" ]]; then
    cmake --build build
fi

if [[ $1 = "f3" ]]; then
    ./build/test
fi

if [[ $1 = "f4" ]]; then
    python main.py
fi

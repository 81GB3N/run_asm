#!/bin/bash

source file_name

# Take the first variable provided to be the debug one
DEBUG="$1"
if [[ "$DEBUG" == true ]]; then
    FILE_NAME="$2"
else
    FILE_NAME="$2"
fi

echo "Docker container running"

# if its the debug flag runs the debug excecution code, if not normal code
if [[ "$DEBUG" == true ]]; then
    echo "Running debug mode"
    gcc -no-pie -g -o "$FILE_NAME" "$FILE_NAME.s"
    gdb -q "./$FILE_NAME"
else
    gcc -no-pie -o "$FILE_NAME" "$FILE_NAME.s"
    "./$FILE_NAME"
fi

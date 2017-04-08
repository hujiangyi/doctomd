#!/bin/bash
echo "main:" + $1
file () {
    echo "file:" + $1
    for file in $1/*
    do
        echo "print file:" + $file
        if [ "$file" =  "$1" ]; then
            continue
        fi
        if [ -f "$file" ]; then
            ./doc-to-md.sh "$file"
        fi
        if [ -d "$file" ]; then
            file "$file"
        fi
    done
}
file $1

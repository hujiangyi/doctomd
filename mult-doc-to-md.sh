#!/bin/bash
echo "main:" + $1
file () {
    echo "file:" + $1
    if [ -f "$1" ]; then
        ./doc-to-md.sh "$1"
    else
        for file in "$1/*"
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
    fi
}
file "$1"

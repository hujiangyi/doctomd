#!/bin/bash


# Setup
FULLPATH="$1"
RENAMEPATH=${FULLPATH//\ /_}
SUBPATH=${RENAMEPATH%.*}
FILENAME=${SUBPATH##*/}
SUBPATH=${SUBPATH%/*}

mv "$FULLPATH" "$RENAMEPATH"

./doc-to-html.sh $RENAMEPATH /tmp/$FILENAME $FILENAME
./html-to-md.sh $RENAMEPATH /tmp/$FILENAME $FILENAME
./cpmd.sh $FILENAME $SUBPATH

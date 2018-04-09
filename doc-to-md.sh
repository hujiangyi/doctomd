#!/bin/bash

# Setup
FULLPATH="$1"
RENAMEPATH=${FULLPATH//\ /_}
SUBPATH=${RENAMEPATH%.*}
FILENAME=${SUBPATH##*/}
SUBPATH=${SUBPATH%/*}
FILETYPE=${RENAMEPATH##*.}

echo 'FULLPATH ' $FULLPATH
echo 'RENAMEPATH ' $RENAMEPATH
echo 'SUBPATH ' $SUBPATH
echo 'FILENAME ' $FILENAME
echo 'FILETYPE ' $FILETYPE

mv "$FULLPATH" "$RENAMEPATH"
if [ $FILETYPE = 'md' ] || [ $FILETYPE = 'txt' ]; then
    if [ ! -d md/$SUBPATH ]; then
        mkdir md/$SUBPATH
    fi
    cp $RENAMEPATH md/$SUBPATH/$FILENAME.md
elif [ $FILETYPE = 'doc' ] || [ $FILETYPE = 'docx' ] ; then
    ./doc-to-html.sh $RENAMEPATH /tmp/$FILENAME $FILENAME
    ./html-to-md.sh $RENAMEPATH /tmp/$FILENAME $FILENAME
    ./cpmd.sh $FILENAME $SUBPATH
else
    echo "skip $RENAMEPATH"
fi


#!/bin/bash
FILENAME=$1
SUBPATH=$2

if [ -f ./md/$SUBPATH/$FILENAME.md ]; then
    rm ./md/$SUBPATH/$FILENAME.md >&2
fi
if [ -d ./md/$SUBPATH/$FILENAME.files ]; then
    rm -rf ./md/$SUBPATH/$FILENAME.files >&2
fi

mkdir -p md/$SUBPATH
mv /tmp/$FILENAME/$FILENAME.md ./md/$SUBPATH
mv /tmp/$FILENAME/$FILENAME.files ./md/$SUBPATH
sed -ig 's/doc_to_html.files/'$FILENAME'.files/g' md/$SUBPATH/$FILENAME.md 


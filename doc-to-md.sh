#!/bin/bash


# Setup
FILENAME=$1
FILENAME=${FILENAME%.*}
FILENAME=${FILENAME##*/}

./doc-to-html.sh $1 /tmp/$FILENAME $FILENAME
./html-to-md.sh $1 /tmp/$FILENAME $FILENAME
 
if [ -f ./md/$FILENAME.md ]; then
    rm ./md/$FILENAME.md >&2
fi
if [ -d ./md/$FILENAME.files ]; then
    rm -rf ./md/$FILENAME.files >&2
fi

mv /tmp/$FILENAME/$FILENAME.md ./md
mv /tmp/$FILENAME/$FILENAME.files ./md
sed -ig 's/doc_to_html.files/'$FILENAME'/g' md/$FILENAME.md 


#!/bin/bash


# Setup
INPUT=$1
TEMP=$2
FILENAME=$3

echo "HTML $TEMP/2_utf8_doc_to_html.html to MD $TEMP/$FILENAME.md"
python html2text.py $TEMP/2_utf8_doc_to_html.html > $TEMP/$FILENAME.md

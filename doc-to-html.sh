#!/bin/bash


# Setup
INPUT=$1
TEMP=$2
FILENAME=$3
if [ -f ~/doc_to_html.html ]; then
    echo "~/doc_to_html.html already exists" >&2
    exit 1
fi

if [ -d /tmp/$FILENAME ]; then
    # Remove temp dir
    rm -rf /tmp/$FILENAME >&2
fi


# Re-add temp dir
mkdir $TEMP >&2
cp $INPUT $TEMP

# Convert to HTML -> ~/doc_to_html.html
INPUT_FILE=`ls $TEMP/*.doc*`
echo "CONVERTING TO HTML: " $INPUT_FILE " -> " ~/doc_to_html.html >&2
automator -i $INPUT_FILE ./doc-to-html.app >&2

# Move from home dir -> 1_doc_to_html.html
echo "MOVING FROM HOME DIR TO TEMP DIR " ~/doc_to_html.html " -> " $TEMP/1_doc_to_html.html >&2
mv ~/doc_to_html.html $TEMP/1_doc_to_html.html
mv ~/doc_to_html.files $TEMP/$FILENAME.files

echo "GBK $TEMP/1_doc_to_html.html TO UTF-8 $TEMP/2_utf8_doc_to_html.html" 
#iconv -c -f GBK -t UTF-8 $TEMP/1_doc_to_html.html >> $TEMP/2_utf8_doc_to_html.html 
./gbktoutf8.sh $TEMP/1_doc_to_html.html $TEMP/2_utf8_doc_to_html.html >&2


#!/bin/bash
 
# Converts each page of a pdf to a JPG
# (requires pdftk and imagemagick)

# Author: giuliani.v@gmail.com
 
PDF=$1
DIR=`basename "$1" .pdf`
 
rm -rf $DIR
mkdir "$DIR"
 
pdftk "$PDF" burst output "$DIR"/%02d.pdf
for FNAME in "$DIR"/*.pdf; do
  OUTPUT=$(basename "$FNAME" .pdf)
  convert -colorspace RGB -interlace none -density 600x600 -quality 100 "$FNAME" "$DIR"/$OUTPUT.jpg
done

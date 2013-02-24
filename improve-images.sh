#!/bin/bash

# Converts note images to b&w and adjust black and white threshold
# so that the visual rendering is improved.
# (Also renames those images from simplescan default naming scheme
# to flat numbering)

# Author: giuliani.v@gmail.com


for FNAME in *jpg
do
  OUTPUT=$(echo $FNAME | sed -e 's/Scanned Document-//g')
  mogrify -normalize -level 45%,80% -type Grayscale "$FNAME"
  mv "$FNAME" "$OUTPUT"
done


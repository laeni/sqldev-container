#!/bin/bash

if [ -f $1 ]; then
  md5=$(md5sum "$1" | awk '{print $1}')
  if [ "$md5" != "$2" ]; then
    echo "md5sum not match, download again. actual md5: \"$md5\", expect md5: \"$2\"."
    rm -rf $1
    curl -LO $3
  fi
else
  curl -LO $3
fi

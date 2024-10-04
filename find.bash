#!/bin/bash

[[ $# -eq 0 ]] || [[ $# -ge 2 ]] && { echo "FATAL: Enter ./find_word.bash <N>" ; exit 1 ; }

DIRIN=input-file.txt
DIR=result.log

function find {
  
  if [[ -n "$DIR" ]]; then
    grep -E -m 1 "\<[a-Я]{"$1"}\>" $DIR
  else
    echo "FATAL ERR"
  fi 
  exit
}

if [[ -f "$DIR" ]] ; then
  find "$@"
else {
  if [[ -f "$DIRIN" ]] ; then
    cat $DIRIN | sed -r 's/[[:space:]]+/\n/g' | sort | uniq -c | sort -nr > $DIR 
    find "$@"
  else
    echo "FATAL: please make input-file.txt with text"
    exit 1
  fi
}
fi

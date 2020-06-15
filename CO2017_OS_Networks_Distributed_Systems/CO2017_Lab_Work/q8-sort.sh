#!/bin/bash
if [ $# -eq 1 ] 
then
if [ -f $1 ]
then
if [ -r $1 ]
then
base=`basename $1`
sort -k 1 -d $1 --field-separator=";" > "alpha-${base}"
sort -k 2 -h $1 --field-separator=";" > "size-${base}"
sort -k 3 -M $1 --field-separator=";" > "date-${base}"
sort -k 4 -n $1 --field-separator=";" > "value-${base}"
else
echo "$1 is not readable."
fi
else
echo "$1 does not exist."
fi
else
echo "Usage: q8-sort.sh <file>"
fi

#! /bin/bash
echo "$USER files changed under 48 hours ago in $1"
find $1 -maxdepth 1 -mtime -2 -type d
find $1 -maxdepth 1 -mtime -2 -type f
echo "directories not owned by $USER"
find $1 -maxdepth 1 ! -user $USER -type d
echo "executable files not owned by $USER"
find $1 -executable ! -user $USER -type f
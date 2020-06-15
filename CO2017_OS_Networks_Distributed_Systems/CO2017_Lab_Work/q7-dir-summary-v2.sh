#! /bin/bash
#dirs= ls -R $1
#dirs=$@
#for dir in $dirs
#do
#echo "Directory: $dir"
#echo "Directories and files edited by $USERNAME in the last 48 hours"
#find $dirs -maxdepth 1 -mindepth 1 -type d -mtime -2 -printf 'Directory Owner: %u Directory Name: %f\n'
#find $dirs -maxdepth 1 -mindepth 1 -type f -mtime -2 -printf 'Directory Owner: %u File Name: %f\n'
#echo "Directories and files not owned by $USER in the last 48 hours"
#find $dirs   -maxdepth 1 -mindepth 1 ! -uid "$(id -u)" -type d -mtime -2 -printf 'Directory Owner: %u Directory Name: %f\n'
#find $dirs -maxdepth 1 -mindepth 1 ! -user $USER -type d -mtime -2 -printf 'Directory Owner: %u Directory Name: %f\n'
#done

#!/bin/bash
dirs=$@
u=$USER
echo $u
for dir in $dirs ; do

if [ -n "$(find . -user "$username" -print -prune -o -prune)" ]; then
  echo "The current directory is owned by $username."
  echo "Directory: $dir"
  find $dirs -maxdepth 1 -type d -mtime -2 -printf '%u %f\n'
fi
if [ -n "$(find . -user "$(id -u)" -print -prune -o -prune)" ]; then
  echo "The current directory is owned by the current user."
  echo "Directory: $dir"
find $dirs -maxdepth 1 -type d -mtime -2 -printf '%u %f\n'
fi
#if [$USER = '%u']
#then
   #echo "Directory: $dir"
#find $dirs -maxdepth 1 -type d -mtime -2 -printf '%u %f\n'
#fi
done

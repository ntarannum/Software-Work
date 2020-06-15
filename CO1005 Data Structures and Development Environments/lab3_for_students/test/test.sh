#!/bin/bash

echo "Test running!"

cat <<EOF
                                                                         
 _ _ _     _                      _          _   _                       
| | | |___| |___ ___ _____ ___   | |_ ___   | |_| |_ ___                 
| | | | -_| |  _| . |     | -_|  |  _| . |  |  _|   | -_|                
|_____|___|_|___|___|_|_|_|___|  |_| |___|  |_| |_|_|___|                
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
 _____ _____ _____ ____  _____ _____ _____ _____                         
|   __|   __|   __|    \| __  |  _  |     |  |  |                        
|   __|   __|   __|  |  | __ -|     |   --|    -|                        
|__|  |_____|_____|____/|_____|__|__|_____|__|__|                        
                                                                         
                                                                         
                               _____ _____ _____ _____ _____ _____ _____ 
                              |     |  _  |     |  |  |     |   | |   __|
                              | | | |     |   --|     |-   -| | | |   __|
                              |_|_|_|__|__|_____|__|__|_____|_|___|_____|
                                                                         

EOF


# first argument is a random string
random=$1


# checks ----------------------------------------

dir="FEEDBACK_MACHINE"
lab=lab3

if [ ! -d $dir ]; then
    echo "$dir does not exist! Creating..."
    mkdir "$dir"
    # exit 1;
fi


if [ ! -d $dir/$lab ]; then
    echo "$dir/$lab does not exist! Creating..."
    mkdir $dir/$lab
    # exit 1;
fi


if [ ! -d src ]; then
    echo "src directory not found!"
    exit 1;
fi


# get current run ----------------------------------------

# find free name
function new_run() {
    local n=1 
    while [ -d "run$n" ]; do ((++n)); done
    echo "run$n"
}

run=`cd $dir/$lab && new_run`

echo "Current run in $run"

# need to be relative to current
rm -f $dir/current
ln -s $lab/$run $dir/current 

# copy src ----------------------------------------

cp -R src $dir/$lab/$run

date=`date +%Y-%m-%d:%H:%M:%S`
uid=`whoami`
pwd=`pwd`
sum=`shasum src/*.java`


# create meta ----------------------------------------

# random should match up with the touched random file (see below)

cat >$dir/$lab/$run/meta <<EOF
XXXrandom:${random}

XXXdate:${date}

XXXuid:${uid}

XXXpwd:${pwd}

XXXsum:${sum}
EOF

touch $dir/$lab/$run/$random

exit 0

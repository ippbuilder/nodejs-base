#!/bin/bash
# argument 1: time in seconds
# argument 2: the command and up to 7 arguments

t=$1
a="$2 $3 $4 $5 $6 $7 $8 $9"

if [ "$#" -lt 2 ]; then
    echo "Usage: wrapper.sh 10 some-comand"
    exit 0
fi

exec $a & pid=$!
sleep $1
kill -9 $pid
echo "Process code $! terminated with exit code $?"

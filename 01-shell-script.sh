#!/bin/bash

echo "All variables passed to script: $@"
echo "Number of vairables passed: $#"
echo "First vairable: $1"
echo "Script Name: $0"
echo "Who is running this : $USER"
echo "Which directory: $pwd"
echo "Home director: $HOME"
echo "PID of the current script: $$"
sleep 5 &
echo "PID of the background command running just now: $!"
wait $!
echo "Line number: $LINENO"
echo "Script executed in $SECONDS seconds"
echo "Random Number $RANDOM"

## EXIT CODE
## $? - previos command status (Success or not)
## 0 -> Success
## 1-127 -> failure

echo "Exit code of previous command: $?"
#!/bin/bash

num1=10
num2=5

sum=$(($num1+$num2))
echo "total: $sum"

# Array
MOVIES=("RRR" "Bahubali" "Pushpa")

echo "Movies are : ${MOVIES[@]}"
echo "First movie: ${MOVIES[0]}"
echo "Second movie: ${MOVIES[1]}"
echo "Third movie: ${MOVIES[2]}"
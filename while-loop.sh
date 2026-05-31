#!/bin/bash

while IFS= read -r line  # IFSnInternal field separator
do
    echo $line
done < helloworld.sh
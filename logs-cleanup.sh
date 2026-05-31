#!/bin/bash
SOURCE_DIR=$1
DAYS=${2:-14}

if [ -z $SOURCE_DIR ]; then
    echo "ERROR:: Missing parameters"
    echo "USAGE: $0 <source-dir> [days(optional default to 14)]"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "ERROR:: Directory $SOURCE_DIR does not exist"
    exit 1
fi

echo "Scanning source directory for logs files older than $DAYS days"
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ -z "$FILES" ]; then
    echo "No log files older than 14 days found"
    exit 0
else
    while IFS= read -r FILE
    do 
        echo "file to be deleted: $FILE"
    done <<<  "$FILES"
fi

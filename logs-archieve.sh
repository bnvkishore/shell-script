#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date "+Y-%m-%d-%H-%M-%S")

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "Either source directory or destination directory is empty"
    echo "USAGE:: $0 [source_dir] [dest_dir] [day:deafult 14]"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory: $SOURCE_DIR does not exist"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then 
    echo "Destination directory: $DEST_DIR does not exist"
    exit 1
fi

FILES=$( find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS" )

if [ -z "$FILES" ]; then
    echo "Log files older than $DAYS not found, nothing todo"
    exit 0
fi

while IFS= read -r FILE
do
    echo $FILE
done <<< $FILES

ARCHIEVE_FILE="$DEST_DIR/logs-archieve-$TIMESTAMP.tar.gz"

tar -czvf $ARCHIEVE_FILE $FILES &> /dev/null
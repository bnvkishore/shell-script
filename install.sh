#!/bin/bash

USERID=$(id -u)

# Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are you trying to install 
# second arg -> Exit code
VALIDATE() {
    echo "Installing $1"
    dnf install $1 -y
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ... FAILED"
        exit 1
    else 
        echo "Installing $1 is ... SUCCESS"
    fi
}

dnf list installed mysql
if [ $? -eq 0 ]; then 
    echo "Mysql is already installed ... SKIPPING"
else
    VALIDATE mysql $?
fi


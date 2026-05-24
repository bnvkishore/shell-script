#!/bin/bash

USERID=$(id -u)

echo "user id : $USERID"

# Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# echo "I'm continuing"

echo "Installing mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing Mysql is failed..."
    exit 1
else 
    echo "Installed successfylly"
fi
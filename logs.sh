#!/bin/bash

#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"  #/home/ec2-user/logs.sh.log

# Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are you trying to install 
# second arg -> Exit code
VALIDATE() {
    echo "Installing $1"
    dnf install $1 -y  &>> $LOGS_FILE
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ... FAILED"
        exit 1
    else 
        echo "Installing $1 is ... SUCCESS"
    fi
}

dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then 
    echo "Mysql is already installed ... SKIPPING"
else
    VALIDATE mysql $?
fi

dnf list installed nginx  &>> $LOGS_FILE
if [ $? -eq 0 ]; then 
    echo "nginx is already installed ... SKIPPING"
else
    VALIDATE nginx $?
fi


#!/bin/bash


#### Verify is substring
SUB='GNU'
TR='GNU/Linux is an operating system'
if [[ $TR == *"$SUB"* ]]; then
  echo "It's there."
else
    echo "No"
fi

#### store user input
echo "Reading user input"
#read -p "Please enter your password: " user_pwd
echo "Thanks for your password $user_pwd"

# get parameters sent into the scripts
echo "user $1"
echo "group $2"
echo "all params $*"
echo "total number of params $#"

#### shell loop

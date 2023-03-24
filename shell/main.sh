#!/bin/bash

echo "setup and configure server"

file_name=config.yaml

if [-d "config"]
then
    echo "reading config directory contents"
    config_files=$(ls config)
else
    echo "config not a directory"
    mkdir config
fi

echo "Using file $file_name for something"
echo "here a some config files"



#### shell loop
echo "all params $*"
echo "total number of params $#"

for param in $*
    do
        if [ -d "$param"] 
        then
            echo "executing scripts in the config folder"
            ls -l "$param"
        fi
        echo $param
    done



#### ENv variabble
printenv
printenv USER
printenv USER | grep jordy
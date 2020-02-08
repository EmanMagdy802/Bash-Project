#!/bin/bash

function dropTable {
    echo "Enter Table Name: "
    read tableName
    rm $tableName 2> /dev/null
    if [[ $? == 0 ]]
    then
        echo "Dropped Successfully"
    else
        echo "table $tableName isn't found"
    fi
}
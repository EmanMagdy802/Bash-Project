#!/bin/bash

function connectToTable {
    echo "Enter Table Name: "
    read tableName
    if [ -f $tableName ]
    then
        while [ true ]; do
        echo -e "\n+---------Main Menu-------------+"
        echo "| 1. Insert Into Table          |"
        echo "| 2. Delete From Table          |"
        echo "| 3. Back                       |"
        echo "+-------------------------------+"
        echo -e "Enter your Choice: "
        read choice
        case $choice in
            1)  insertIntoTable  ;;
            2)  deleteFromTable ;;
            3)  break ;;
            *) echo "Wrong Choice";
        esac
        done
    else
        echo "table $tableName isn't found"
    fi
}
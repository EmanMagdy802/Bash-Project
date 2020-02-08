#!/bin/bash

function connectToTable {
    echo "Enter Table Name: "
    read tableName
    if [ -f $tableName ]
    then
        while [ true ]; do
        echo -e "\n+---------Main Menu-------------+"
        echo "| 1. Show Table          |"
        echo "| 2. Insert Into Table          |"
        echo "| 3. Delete From Table          |"
        echo "| 4. Back                       |"
        echo "+-------------------------------+"
        echo -e "Enter your Choice: "
        read choice
        case $choice in
            1)  showTable ;;
            2)  insertIntoTable $tableName;;
            3)  deleteFromTable ;;
            4)  break ;;
            *) echo "Wrong Choice";
        esac
        done
    else
        echo "table $tableName isn't found"
    fi
}
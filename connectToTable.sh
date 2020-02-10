#!/bin/bash

function connectToTable {
    echo `printf "${YELLOW}${bold}Enter Table Name: ${NC}"`
    read -e tableName
    if [ -f $tableName ]
    then
        while [ true ]; do
        echo -e "\n+---------Main Menu-------------+"
        echo "| 1. Show Table                 |"
        echo "| 2. Insert Into Table          |"
        echo "| 3. Delete From Table          |"
        echo "| 4. Back                       |"
        echo "+-------------------------------+"
		echo ""
        echo `printf "${YELLOW}${bold}Enter your Choice: ${NC}"`
        read -e choice
        case $choice in
            1)  showTable ;;
            2)  insertIntoTable $tableName;;
            3)  deleteFromTable ;;
            4)  break ;;
            *) echo `printf "${RED}${bold}Wrong Choice, please enter Right Choice${NC}"`;;
        esac
        done
    else
        echo `printf "${RED}${bold}Table $tableName doesn't exist${NC}";`
    fi
}

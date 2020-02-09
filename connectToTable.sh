#!/bin/bash

function connectToTable {
    printf "${YELLOW}${bold}Enter Table Name: ${NC}"
    read tableName
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
        printf "${YELLOW}${bold}Enter your Choice: ${NC}"
        read choice
        case $choice in
            1)  showTable ;;
            2)  insertIntoTable $tableName;;
            3)  deleteFromTable ;;
            4)  break ;;
            *) printf "${RED}${bold}Wrong Choice, please enter Right Choice${NC}";
        esac
        done
    else
        #Error msg
        printf "${RED}${bold}table $tableName doesn't exist${NC}";
    fi
}

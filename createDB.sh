#!/bin/bash

function createDB {
	while [ true ]
    do
		printf "${YELLOW}${bold}Enter The Name Of Database:${NC} "
		read -e dbName
		case $dbName in
        	("")       
            	printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"
            	echo "";;
        	(*[!a-zA-Z]*) 
            	printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"
            	echo "";;
        	(*)        
            	break;;
		esac
	done

	mkdir ./dbs/$dbName 2> /dev/null
	if [[ $? == 0 ]]
	then
    	printf "${BLUE}${bold}Database Created Successfully${NC}\n"
    else
    	printf "${RED}${bold}$dbName is already exist!${NC}\n"
    fi
}

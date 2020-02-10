#!/bin/bash

function createDB {
	while [ true ]
    do
		echo `printf "${YELLOW}${bold}Enter The Name Of Database:${NC} "`
		read -e dbName
		case $dbName in
        	("")       
            	echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`;;
        	(*[!a-zA-Z]*) 
            	echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`;;
			("exit")
            	echo `printf "${BLUE}${bold}Terminating Creation Process${NC}\n"`
            	return;;
        	(*)        
            	break;;
		esac
	done

	mkdir ./dbs/$dbName 2> /dev/null
	if [[ $? == 0 ]]
	then
    	echo `printf "${BLUE}${bold}Database Created Successfully${NC}\n"`
    else
    	echo `printf "${RED}${bold}$dbName is already exist!${NC}\n"`
    fi
}

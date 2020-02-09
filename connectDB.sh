#!/bin/bash

function connectDB {
	while [ true ]
    do
  		printf "${YELLOW}${bold}Enter Database Name: ${NC}"
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


  cd ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
  	printf "${BLUE}${bold}Database $dbName Successfully Connected${NC}\n"
    tablesMenu
  else
  	printf "${RED}${bold}Database $dbName isn't found${NC}\n"
  fi
}

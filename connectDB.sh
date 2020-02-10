#!/bin/bash

function connectDB {
	while [ true ]
    do
  		echo `printf "${YELLOW}${bold}Enter Database Name: ${NC}"`
  		read -e dbName
		case $dbName in
        	("")       
            	echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`;;
       		(*[!a-zA-Z]*) 
            	echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`;;
        	(*)        
            	break;;
		esac
	done


  cd ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
  	echo `printf "${BLUE}${bold}Database $dbName Successfully Connected${NC}\n"`
    tablesMenu
  else
  	echo `printf "${RED}${bold}Database $dbName isn't found${NC}\n"`
  fi
}

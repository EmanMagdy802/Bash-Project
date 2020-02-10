#!/bin/bash

function deleteFromTable {
	echo `printf "${YELLOW}${bold}Enter the Number of Record you want to Delete from $tableName: ${NC}"`
	lines=`wc -l $tableName | awk '{ print $1 }'`
	echo $lines
	typeset -i recordNo;
	read -e recordNo;
	if  [[ $recordNo == ^[0-9]+$ ]]
	then
		echo `printf "${RED}${bold}$recordNo Not valid, Enter valid Number${NC}\n"`
	
	elif [[ $recordNo -le 0 ]]
	then 
		echo `printf "${RED}${bold}$recordNo Not valid, number is too low${NC}\n"`
	
	elif [[ $recordNo -ge $lines ]]
	then 
		echo `printf "${RED}${bold}$recordNo Not valid, number is too high or file is empty${NC}\n"`
	
	else
		recordNo=$recordNo+1;
		sed -i "$recordNo d" $tableName;
		recordNo=$recordNo-1
		echo `printf "${BLUE}${bold}$recordNo Deleted Successfully ${NC}\n"`
	fi

}

#!/bin/bash

function deleteFromTable {
	printf "${YELLOW}${bold}Enter the Number of Record you want to Delete from $tableName: ${NC}"
	typeset -i recordNo;
	read -e recordNo;
	if  [[ $recordNo == ^[0-9]+$ ]]
	then
	printf "${RED}${bold} $recordNO Not valid,Enter valid Number${NC}\n"
	elif [[ $recordNo -le 2 ]]
	then 
	printf "${RED}${bold} $recordNO Not valid,Enter valid Number${NC}\n"
	else
	recordNo=$recordNo+1;
	sed -i "$recordNo d" $tableName;
	printf "${BLUE}${bold} $recordNO Deleted Successfully ${NC}\n"
	fi

}

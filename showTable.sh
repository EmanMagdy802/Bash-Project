#!/bin/bash

function showTable {
    printf "${YELLOW}${bold}Show Table Content Here${NC}\n"
    #cat $tableName 2> /dev/null
	awk '{for( i=0; i<=NF; i+=2) $i= "|" }' $tableName
	#awk '{if(NF%2 != 0)print}' $tableName
    #if [[ $? != 0 ]]
    #then
    #printf "${RED}${bold}Error: Displaying Table${NC}"
    #fi
	
}

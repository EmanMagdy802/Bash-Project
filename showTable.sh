#!/bin/bash

function showTable {
    echo `printf "${YELLOW}${bold}Show Table Content Here${NC}\n"`
    cat $tableName 2> /dev/null
    if [[ $? != 0 ]]
    then
    	echo `printf "${RED}${bold}Error: Displaying Table${NC}"`
    fi
	
}

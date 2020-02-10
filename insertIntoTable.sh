#!/bin/bash

function insertIntoTable {
    line=$(head -n 1 $1)
    IFS='|' read -r -a config <<< "$line"
    counter=1
    size=${#config[@]}
    #echo $size
    data=""
    while [ $counter -lt $size ]
    do
        while [ true ]
        do
            echo `printf "${YELLOW}${bold}Please Enter ${GREEN}${bold}${config[$counter]}${NC} ${YELLOW}${bold}value:${NC}\n"`
            read -e value
            if [ -z "$value" ]
            then 
                echo `printf "${RED}${bold}Error: value mustn't be empty ${NC}\n"`
                echo `printf "${RED}${bold}Tip:you can type exit to terminate the insertion into table ${NC}\n"`
            elif [ "$value" = "exitInsert" ]
            then
                echo `printf "${BLUE}${bold}Terminating insertion process${NC}\n"`
                    return;
            else
                if [ "${config[$counter+1]}" = "number" ]
                then 
                    if [ "$value" = "exitInsert" ]
                    then
                        echo `printf "${BLUE}${bold}Terminating insertion process${NC}\n"`
                        return;
                    fi
                    if checkIfNumber $value;
                    then
                        break;
                    else
                        
                        echo `printf "${RED}${bold}Tip:you can type exitInsert to terminate the insertion into table${NC}\n"`
                    fi
                else
                    if [ "$value" = "exitInsert" ]
                    then
                        echo `printf "${BLUE}${bold}Terminating insertion process${NC}\n" `
                        return;
                    else
                        break
                    fi
                fi
            fi
        done
        
        data+=${value}
        data+="|"
        ((counter+=2))
    done
    echo "${data}" >> $tableName
}

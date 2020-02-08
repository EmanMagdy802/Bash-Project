#!/bin/bash

function insertIntoTable {
    line=$(head -n 1 $1)
    IFS='|' read -r -a config <<< "$line"
    counter=1
    size=${#config[@]}
    echo $size
    data=""
    while [ $counter -lt $size ]
    do
        while [ true ]
        do
            echo "please enter ${config[$counter]} value"
            read value
            if [ -z "$value" ]
            then 
                echo "Error, value mustn't be empty"
                echo "Tip:you can type exit to terminate the insertion into table"
                echo ""
            else
                if [ "${config[$counter+1]}" = "number" ]
                then 
                    if [ "$value" = "exitInsert" ]
                    then
                        echo "Terminating insertion process" 
                        return;
                    fi
                    if checkIfNumber $value;
                    then
                        break;
                    else
                        echo "Error, value must be number"    
                        echo "Tip:you can type exitInsert to terminate the insertion into table"
                        echo ""
                    fi
                else
                    if [ "$value" = "exitInsert" ]
                    then
                        echo "Terminating insertion process" 
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
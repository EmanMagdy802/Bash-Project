#!/bin/bash

function createTable {
    while [ true ]
    do
        echo "Enter table's name"
        read tableName
        tableName="${tableName,,}"
        case $tableName in
        ("")       
            echo "Error, please enter alphabets"
            echo "Tip:you can type exit to terminate the creation of the table"
            echo "";;
        (*[!a-zA-Z]*) 
            echo "Error, please enter alphabets"
            echo "Tip:you can type exit to terminate the creation of the table"
            echo "";;
        ("exit")
            echo "Terminating creation process"
            return;;
        (*)        
            break;;
        esac
    done
    
    if [ -f "./$tableName" ];
    then 
        echo " Error, table exists"
        return
    fi
    
    while [ true ]; 
    do
        echo "Enter the number of attributes"
        read attrsNumber
        if [ "$attrsNumber" = "exit" ]
        then
            echo "Terminating creation process" 
            return;
        fi
        if checkIfNumber $attrsNumber;
        then
            break;
        else
            echo "Tip:you can type exit to terminate the creation of the table"
            echo ""
        fi
    done
    
    config="${attrsNumber}|"
    for i in `seq 1 $attrsNumber`
    do
        while [ true ]
        do
            echo "Enter attribute name"
            read attrName
            attrName="${attrName,,}"
            if [[ $config =~ $attrName ]]
            then
                echo "Error, attribute name already exists"
                continue
            fi
            case $attrName in
            ("")       
                echo "Error, please enter alphabets"
                echo "Tip:you can type exit to terminate the creation of the table"
                echo "";;
            (*[!a-zA-Z]*) 
                echo "Error, please enter alphabets "
                echo "Tip:you can type exit to terminate the creation of the table"
                echo "";;
            ("exit")
                echo "Terminating creation process"
                return;;
            (*)        
                break;;
            esac
        done
        
        while [ true ]
        do
            echo "Enter attribute type (text or number)"
            read attrType
            if [ "$attrType" = "text" ] || [ "$attrType" = "number" ]
            then
                config+=$attrName
                config+="|"
                config+=$attrType
                config+="|"
                break
            elif [ "$attrType" = "exit" ]
            then
                echo "Terminating the creation process"
                return
            else
                echo "Error, You entered wrong type"
                echo "Tip:you can type exit to terminate the creation of the table"
                echo ""
            fi
        done
    done

    touch $tableName
    echo "${config}" >> $tableName
    echo "table created succesfully"

}

function checkIfNumber {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; 
    then
        echo "Error, please enter a number"
        return 1
    else
        return 0
    fi
}


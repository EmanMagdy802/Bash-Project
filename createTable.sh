#!/bin/bash

function createTable {
    error="Error"
    
    while [ true ]
    do
        echo "Enter table's name"
        read tableName
        case $tableName in
        ("")       
            echo "Please enter alphabets only or exit to terminate";;
        (*[!a-zA-Z]*) 
            echo "Please enter alphabets only or exit to terminate";;
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
    
    while [ true ]; do
    echo "Enter the number of attributes"
    read attrsNumber
    if [ "$attrNumber" = "exit" ]
    then 
        return;
    fi
    if checkIfNumber $attrsNumber;
    then
        break;
    else
        echo "Or you can type exit to terminate the creation of the table"
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
            case $attrName in
            ("")       
                echo "Please enter alphabets only or exit to terminate";;
            (*[!a-zA-Z]*) 
                echo "Please enter alphabets only or exit to terminate";;
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
                error="none"
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
                echo "You entered wrong type"
                echo "Type exit to terminate the creation of the table"
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
        echo "You should enter a number"
        return 1
    else
        return 0
    fi
}


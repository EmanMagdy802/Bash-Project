#!/bin/bash

function createTable {
    while [ true ]
    do
        echo `printf "${YELLOW}${bold}Enter table's name${NC}\n"`
        read -e tableName
        tableName="${tableName,,}"
        case $tableName in
        ("")       
            echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`
            echo `printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"`;;
        (*[!a-zA-Z]*) 
            echo `printf "${RED}${bold}Error: please enter alphabets${NC}\n"`
            echo `printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"`;;
        ("exit")
            echo `printf "${BLUE}${bold}Terminating Creation Process${NC}\n"`
            return;;
        (*)        
            break;;
        esac
    done
    
    if [ -f "./$tableName" ];
    then 
        echo `printf "${RED}${bold}Error: Table exists${NC}\n"`
        return
    fi
    
    while [ true ]; 
    do
        echo `printf "${YELLOW}${bold}Enter the Number of Attributes${NC}\n"`
        read -e attrsNumber
        if [ "$attrsNumber" = "exit" ]
        then
            echo `printf "${BLUE}${bold}Terminating Creation Process${NC}\n"`
            return;
        fi
        if checkIfNumber $attrsNumber;
        then
            break;
        else
            echo `printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"`
        fi
    done
    
    config="${attrsNumber}|"
    for i in `seq 1 $attrsNumber`
    do
        while [ true ]
        do
            echo `printf "${YELLOW}${bold}Enter attribute name${NC}\n"`
            read -e attrName
            attrName="${attrName,,}"
            if [[ $config =~ $attrName ]]
            then
                echo `printf "${RED}${bold}Error: attribute name already exists${NC}\n"`
                continue
            fi
            case $attrName in
            ("")       
                echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`
                echo `printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"`;;
            (*[!a-zA-Z]*) 
                echo `printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"`
                echo `printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"`;;
            ("exit")
                echo `printf "${BLUE}${bold}Terminating Creation Process${NC}\n"`
                return;;
            (*)        
                break;;
            esac
        done
        
        while [ true ]
        do
            echo `printf "${YELLOW}${bold}Enter attribute type (text or number)${NC}\n"`
            read -e attrType
            if [ "$attrType" = "text" ] || [ "$attrType" = "number" ]
            then
                config+=$attrName
                config+="|"
                config+=$attrType
                config+="|"
                break
            elif [ "$attrType" = "exit" ]
            then
                echo `printf "${BLUE}${bold}Terminating the creation process${NC}\n"`
                return
            else
                echo `printf "${RED}${bold}Error: You Entered wrong type${NC}\n"`
                echo `printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"`
            fi
        done
    done

    touch $tableName
    echo "${config}" >> $tableName
    echo `printf "${BLUE}${bold}Table Created Succesfully${NC}\n"`

}

function checkIfNumber {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; 
    then
        echo `printf "${RED}${bold}Error: Please Enter a Number${NC}\n"`
        return 1
    else
        return 0
    fi
}


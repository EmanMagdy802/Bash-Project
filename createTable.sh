#!/bin/bash

function createTable {
    while [ true ]
    do
        printf "${YELLOW}${bold}Enter table's name${NC}\n"
        read tableName
        tableName="${tableName,,}"
        case $tableName in
        ("")       
            printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"
            printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"
            echo "";;
        (*[!a-zA-Z]*) 
            printf "${RED}${bold}Error: please enter alphabets${NC}\n"
            printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"
            echo "";;
        ("exit")
            printf "${BLUE}${bold}Terminating Creation Process${NC}\n"
            return;;
        (*)        
            break;;
        esac
    done
    
    if [ -f "./$tableName" ];
    then 
        printf "${RED}${bold}Error: Table exists${NC}\n"
        return
    fi
    
    while [ true ]; 
    do
        printf "${YELLOW}${bold}Enter the Number of Attributes${NC}\n"
        read attrsNumber
        if [ "$attrsNumber" = "exit" ]
        then
            printf "${BLUE}${bold}Terminating Creation Process${NC}\n" 
            return;
        fi
        if checkIfNumber $attrsNumber;
        then
            break;
        else
            printf "${BLUE}${bold}Tip:you can type exit to terminate the creation of the table${NC}\n"
            echo ""
        fi
    done
    
    config="${attrsNumber}|"
    for i in `seq 1 $attrsNumber`
    do
        while [ true ]
        do
            printf "${YELLOW}${bold}Enter attribute name${NC}\n"
            read attrName
            attrName="${attrName,,}"
            if [[ $config =~ $attrName ]]
            then
                printf "${RED}${bold}Error: attribute name already exists${NC}\n"
                continue
            fi
            case $attrName in
            ("")       
                printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"
                printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"
                echo "";;
            (*[!a-zA-Z]*) 
                printf "${RED}${bold}Error: Please Enter Alphabets${NC}\n"
                printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"
                echo "";;
            ("exit")
                printf "${BLUE}${bold}Terminating Creation Process${NC}\n"
                return;;
            (*)        
                break;;
            esac
        done
        
        while [ true ]
        do
            printf "${YELLOW}${bold}Enter attribute type (text or number)${NC}\n"
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
                printf "${BLUE}${bold}Terminating the creation process${NC}\n"
                return
            else
                printf "${RED}${bold}Error: You Entered wrong type${NC}\n"
                printf "${BLUE}${bold}Tip:You can type exit to terminate the creation of the table${NC}\n"
                echo ""
            fi
        done
    done

    touch $tableName
    echo "${config}" >> $tableName
    printf "${BLUE}${bold}Table Created Succesfully${NC}\n"

}

function checkIfNumber {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; 
    then
        printf "${RED}${bold}Error: Please Enter a Number${NC}\n"
        return 1
    else
        return 0
    fi
}


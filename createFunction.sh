2#!/bin/bash

function createDB {
  printf "${YELLOW}${bold}Enter The Name Of Database:${NC} "
  read -e dbName
  mkdir ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
    printf "${BLUE}${bold}Database Created Successfully${NC}\n"
  else
    printf "${RED}${bold}$dbName is already exist!${NC}\n"
  fi
}

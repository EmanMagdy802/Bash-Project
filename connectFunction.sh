#!/bin/bash

function connectDB {
  printf "${YELLOW}${bold}Enter Database Name:${NC}"
  read dbName
  cd ./dbs/$dbName
  if [[ $? == 0 ]]
    then
    printf "${BLUE}${bold}Database $dbName Successfully Connected${NC}\n"
    tablesMenu
  else
    printf "${RED}${bold}Database $dbName isn't found${NC}\n"
  fi
}

#!/bin/bash

function dropDB {
  printf "${YELLOW}${bold}Enter Database Name:${NC}"
  read -e dbName
  rm -r ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
    printf "${BLUE}${bold}Dropped Successfully${NC}\n"
  else
    printf "${RED}${bold}Database $dbName isn't found${NC}\n"
  fi
}

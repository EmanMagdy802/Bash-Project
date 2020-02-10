#!/bin/bash

function dropDB {
  echo `printf "${YELLOW}${bold}Enter Database Name:${NC}"`
  read -e dbName
  rm -r ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
    echo `printf "${BLUE}${bold}Dropped Successfully${NC}\n"`
  else
    echo `printf "${RED}${bold}Database $dbName isn't found${NC}\n"`
  fi
}

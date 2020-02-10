#!/bin/bash

function dropTable {
  echo `printf "${YELLOW}${bold}Enter Table Name: ${NC}\n"`
  read -e tableName
  rm $tableName 2> /dev/null
  if [[ $? == 0 ]]
  then
  echo `printf "${BLUE}${bold}Table Dropped Successfully${NC}\n"`
  else
  echo `printf "${RED}${bold}$tableName isn't found${NC}\n"`
  fi
}

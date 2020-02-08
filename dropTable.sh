#!/bin/bash

function dropTable {
  printf "${YELLOW}${bold}Enter Table Name: \c"
  read tableName
  rm $tableName 2> /dev/null
  if [[ $? == 0 ]]
  then
  printf "${BLUE}${bold}Table Dropped Successfully${NC}\n"
  else
  printf "${RED}${bold}$tableName isn't found${NC}\n"
  fi
}

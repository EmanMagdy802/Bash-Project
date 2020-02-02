#!/bin/bash

function createDB {
  echo -e "Enter The Name Of Database: "
  read dbName
  mkdir ./Bash-Project/$dbName
  if [[ $? == 0 ]]
  then
    echo "Database Created Successfully"
  else
    echo "Error, $dbName is already exist"
  fi
  mainMenu
}

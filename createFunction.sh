#!/bin/bash

function createDB {
  echo -e "Enter The Name Of Database: "
  read dbName
  mkdir ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
    echo "Database Created Successfully"
  else
    echo "Error, $dbName is already exist"
  fi
  mainMenu
}

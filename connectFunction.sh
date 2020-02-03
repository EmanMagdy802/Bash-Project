#!/bin/bash

function connectDB {
  echo -e "Enter Database Name: "
  read dbName
  cd ./dbs/$dbName
  if [[ $? == 0 ]]; then
    echo "Database $dbName Successfully Connected"
    tablesMenu
  else
    echo "Database $dbName isn't found"
    mainMenu
  fi
}

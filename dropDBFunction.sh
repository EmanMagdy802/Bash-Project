#!/bin/bash

function dropDB {
  echo -e "Enter Database Name: "
  read dbName
  rm -r ./dbs/$dbName 2> /dev/null
  if [[ $? == 0 ]]
  then
    echo "Dropped Successfully"
  else
    echo "Database $dbName isn't found"
  fi
}

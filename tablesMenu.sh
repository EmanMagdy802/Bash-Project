#!/bin/bash

function tablesMenu {
  while [ true ]; do
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. List All Tables            |"
  echo "| 2. Create Table               |"
  echo "| 3. Connect To Table           |"
  echo "| 4. Drop Table                 |"
  echo "| 5. Back To Main Menu          |"
  echo "+-------------------------------+"
  echo -e "Enter your Choice: "
  read choice
  case $choice in
    1)  ls -p | grep -v /  ;;
    2)  createTable ;;
    3)  connectToTable ;;
    4)  dropTable ;;
    5)  cd ../.. 
        break ;;
    *) echo "Wrong Choice";
  esac
  done

}
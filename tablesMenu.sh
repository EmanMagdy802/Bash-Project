#!/bin/bash

function tablesMenu {
  while [ true ]; do
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. List All Tables                |"
  echo "| 2. Create Table                   |"
  echo "| 3. Connect To Table               |"
  echo "| 4. Insert Into Table              |"
  echo "| 5. Delete From Table              |"
  echo "| 6. Drop Table                     |"
  echo "| 7. Back To Main Menu              |"
  echo "+-------------------------------+"
  echo -e "Enter your Choice: "
  read choice
  case $choice in
    1)  ls -p | grep -v /  ;;
    2)  echo "create Table" ;;
    3)  echo "connect to Table" ;;
    4)  echo "insert Table" ;;
    5)  echo "delete Table" ;;
    6)  echo "Drop Table" ;;
    7)  cd ../.. 
        mainMenu ;;
    *) echo "Wrong Choice";
  esac
  done

}
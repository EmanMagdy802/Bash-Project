#!/bin/bash
source ./createFunction.sh
source ./connectFunction.sh
source ./dropDBFunction.sh

mkdir -p ./dbs
echo "Welcome to our DataBase Management System"
function mainMenu {
  while [ 1 -eq 1 ]; do
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. List DB                    |"
  echo "| 2. Create DB                  |"
  echo "| 3. Connect DB                 |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter your Choice: "
  read choice
  case $choice in
    1)  ls ./dbs ;;
    2)  createDB ;;
    3)  connectDB ;;
    4)  dropDB ;;
    5)  exit ;;
    *) echo "Wrong Choice";
  esac
  done

}
mainMenu


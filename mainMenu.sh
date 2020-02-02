#!/bin/bash


echo "Welcome to our DataBase Management System"
function mainMenu {
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. List DB                    |"
  echo "| 2. Create DB                  |"
  echo "| 3. Connect DB                 |"
  echo "| 4. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter your Choice: "
  read choice
  case $choice in
    1)  ls ./Bash-Project ; mainMenu;;
    2)  createDB ;;
    3)  ConnectDB ;;
    4)  exit ;;
    *) echo "Wrong Choice" ; mainMenu;
  esac
}
mainMenu


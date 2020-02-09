#!/bin/bash
source ./createFunction.sh
source ./showTable.sh
source ./createTable.sh
source ./connectToTable.sh
source ./insertIntoTable.sh
source ./deleteFromTable.sh
source ./dropTable.sh
source ./tablesMenu.sh
source ./connectFunction.sh
source ./dropDBFunction.sh

YELLOW='\033[1;33m'
GREEN='\e[32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'
bold=$(tput bold)


mkdir -p ./dbs
printf "${YELLOW}${bold}<<Welcome to our DataBase Management System>>${NC}"
function mainMenu {
  while [ 1 -eq 1 ]; do
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. List DB                    |"
  echo "| 2. Create DB                  |"
  echo "| 3. Connect DB                 |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Exit                       |"
  echo "+-------------------------------+"
  printf "${YELLOW}${bold}Enter your Choice: ${NC}"
  read choice
  case $choice in
    1)  ls ./dbs ;;
    2)  createDB ;;
    3)  connectDB ;;
    4)  dropDB ;;
    5)  exit ;;
    *) printf "${RED}${bold}Wrong Choice, please enter Right Choice${NC}";
  esac
  done

}
mainMenu


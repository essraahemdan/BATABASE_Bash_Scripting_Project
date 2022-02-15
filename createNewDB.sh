#!/usr/bin/bash
PS3="Enter Option => "

echo "Enter The Name 0f DataBase "
read databaseName
if [[ -d "$databaseName" ]]
then
    echo "ERROR: "$databaseName" already exists!"
	select val in "Press 1 To Create Another One" "Press 2 To Back To Home"
	do
	case $REPLY in

            1)

            	clear ; . createNewDB.sh      ; break
            	;;
	    2)
            	
		clear ; . DBMenu.sh ; break 
		;;
            * ) echo "Invalid Choice"
		
	esac
	done
else
  mkdir $databaseName
  if [[ $? -eq 0 ]]
  then
    	echo "Database Created Successfully :)"
	. DBMenu.sh
  else
    	echo "Error Creating Database $databaseName Please try again!"
  fi
fi

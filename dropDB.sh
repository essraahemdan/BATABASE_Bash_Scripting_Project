#!/usr/bin/bash
PS3="enter option => "

echo "Enter the name of database you want to delete: "
read databaseName
if [[ -d "$databaseName" ]]
then
	rm -r $databaseName
	if [[ ! -d "$databaseName" ]]
	then
    	echo "Deleted!"
	fi

else

	echo "FATAL $databasename dosen't exist!"

        select val in "Press 1 To Type Another DataBase Name" "Press 2 To Create Another One" "Press 3 To Back To MENU"

        do

	case $REPLY in
        1)

                clear ; . connect.sh ; clear ; break
                ;;
        2)

                clear ; . createdb.sh  ; break
                ;;
        3)
                clear ; . select.sh ; clear ; break
                ;;

	* ) echo "Invalid choice"
        esac
        done
fi


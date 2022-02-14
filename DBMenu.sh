#!/usr/bin/bash
PS3="Enter Option => "

echo "~~~ MENU ~~~"
select val in "Press 1 TO CREATE DATABASE" "Press 2 TO LIST DATABASE" "Press 3 TO CONNECT TO DATABASE" "Press 4 TO DROP DATABASE" "Press 5 TO EXIT"
do
    case $REPLY in
        1)
           clear ; . createNewDB.sh ; . DBMenu.sh
            ;;
	2)
           clear ; . listDBs.sh ; . DBMenu.sh
            ;;
	3)
            clear ; . connectDB.sh ; . DBMenu.sh
            ;;
	4)
            clear ; . dropDB.sh ; . DBMenu.sh
            ;;
	5)
            echo "G00DBYE :(" ; exit
            ;;
	*) clear ; echo "Invalid Option" ; . DBMenu.sh ;;
    esac
done


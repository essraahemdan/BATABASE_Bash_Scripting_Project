
##!/usr/bin/bash
PS3="Enter Option => "
select val in  "Press 1 TO Create Table" "Press 2 To List Tables " "Press 3 TO Drop Table" " Press 4 To Insert into Table" "Press 5 Select from Table" "Press 6  To Truncate Table" "Press 7 To Back To Home"
do
	case $REPLY in
		1 ) clear  ; . createTable.sh       ; . TableMenu.sh;; 
		2 ) clear ; . listTables.sh        ; . TableMenu.sh;;
		3 ) clear ; . dropTable.sh         ; . TableMenu.sh;;
		4 ) clear ; . insertIntoTable.sh     ; . TableMenu.sh;;
		5 ) clear ; . selectFromTable.sh   ; . TableMenu.sh;;
		6 ) clear ; . truncateTable.sh     ; . TableMenu.sh;;
		7 ) clear ;    cd ..               ; . DBMenu.sh;;
		* ) clear ; echo "Invalid choice!" ; . TableMenu.sh ; 
	esac
done

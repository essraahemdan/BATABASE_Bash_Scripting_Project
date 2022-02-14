#!/usr/bin/bash
PS3="enter option => "

echo "Enter the name of database you want to connect: "
read databaseName
if [[ -d "$databaseName" ]]
then
   cd $databaseName
   clear 
   echo "Welcome To $databaseName DataBase :)"
#   . select2.sh
else
   echo "FATAL $databaseName dosen't exist!"
    
	select val in "Press 1 To Type Another DATABASE Name" "Press 2 To CREATE ONE" "Press 3 To BACK TO HOME"
	
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
	    
	 * ) echo "Invalid Option"
		esac
	done
fi

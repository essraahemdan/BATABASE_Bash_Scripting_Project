read -p  "Enter Table Name: " tableName
if [[ -z $tableName  ]];
   then 
        echo "Empty Input"
        . createTable.sh

        #check validation
elif [[ $tableName =~ ['!@#$%^&*()_+'] ]];
    then
        echo "wrong input"
        . createTable.sh

else 
	if [[ -f $tableName ]] ;
	    then 
		    echo $tableName Table Already Exits
		     . createTable.sh
	else    
        #Coloumn number Validation
        while true
		do
		    read -p "Enter Number of Columns: " NumberCol
		    # less than 0 or empty
            if [[ $NumberCol =~ [^1-9] ]]; 
                then
                    echo " input shoud be started from number 1"
            elif [[ -z $NumberCol ]] ;
                then   
                    echo "Empty Input"
            else
                break 
            fi
        done
        #End of Coloumn number Validation
		echo "First Column Must Be PRIMARY KEY !!"
    #Start of Coloumn name Validation
        for (( i = 1 ; i <= NumberCol ; i++ ));
            do      
                while true
                    do
                        read -p "Write Column Name $i : " ColName
                        if [[ $ColName =~ ['!@#$%^&*()_+'] ]]; then
                            echo "incorrect input"
                        elif [[ -z $ColName ]] ;
                            then
                                echo "Empty Column Name"
                                     
                        else 
                             break ;
                        fi
                    done 
                read -p "Enter DataType of $ColName column[string/int] :" ColDataType
                 while [[ $ColDataType != int && $ColDataType != string ]];
                    do      
                       echo "Wrong DataType, Enter Int Or String"
                            read ColDataType
                    done

                                
                touch $tableName
                touch $tableName.type

                if [[ i -eq NumberCol ]] ; 
                then
                    echo 	$ColName >> $tableName
                    echo    $ColDataType>> $tableName.type
                else
                    echo -n $ColName":" >> $tableName 
                    echo -n $ColDataType":" >> $tableName.type
                fi
                                
            done
                #End of Coloumn number Validation

                        echo "-----------------------Table has been created---------------------------"
                       
                        
	fi
fi
. TableMenu.sh
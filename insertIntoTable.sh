echo  "--------------------------Insert Into Table-----------------------------"           
        echo  "________________________________________________________________________"

        read -p "Enter Table Name You Wanna insert Into: "  tbName
                if [[ -f $tbName ]]; then
 	                typeset -i cntColumns=`awk -F: '{print NF}' $tbName | head -1` ; #get number of columns in table
	                tput setaf 3  #color
                        echo "PRIMARY KEY MUST BE UNIQUE" 
                                for (( i=1 ; i <= $cntColumns ; i++ ));   #operation
                                do
                                        colname=$(awk -v"n=$i" 'BEGIN{FS=":"}{print $n}' $tbName); #first line
                                        coltype=$(awk -v"n=$i" 'BEGIN{FS=":"}{print $n}' $tbName.type); 
                                        if [[ $i -eq 1 ]] ;
                                        then 
                                                check=0
                                                while [[ $check -eq 0 ]] ;
                                                do
                                                tput setaf 7       

                                                read -p "Enter Value for $colname Column: " value   
                                                if ! [[ -z $value ]]; then

                                                        if ! [[ $value =~ [`cut -d':' -f1 $tbName | grep -x $value`] ]]; then
                                                                if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z0-9@_.]) ]];
                                                                then		
                                                                echo -n  $value":" >> $tbName;
                                                                fi 
                                                        check=1
                                                        fi	
                                                fi
                                                done  
                                        #End of loop                               
                                        fi

                                        #Start loop from Second Coloumn
                                        flag=0
                                        while [[ $flag -eq 0 && $i -gt 1 ]];
                                        do
                                                tput setaf 7
                                                echo "Enter Value for $colname Column: "
                                                read value
                                                if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z0-9@_.]) ]]; then
                                                        if [[ $i == $cntColumns ]]; then
                                                                echo $value >> $tbName;
                                                        else
                                                                echo -n  $value":" >> $tbName;
                                                        fi
                                                flag=1;
                                                fi
                                        done
                                        #end of loop
                                done
                else	        
                        tput setaf 7  #color
                        echo  "------------------------------------------------------------------------"
                        echo "Sorry $tbName Doesn't Exist";
                        echo "__________________________________________________________________"
                        tput setaf 7  #color
                fi  
        . TableMenu.sh
}

        echo  "--------------------------Select From Table-----------------------------"           
        echo  "________________________________________________________________________"

        read -p "Enter Name of table to select : "  tbName
        
        if [[ -f $tbName ]] ; then
                select choice in "Press 1 To Select AllRecords" "Press 2 To Select Record"  "Press 3 To Select Column" "Press 4 To Back To TableMenu"  
                do
                        case $choice in
                                1)
                                        echo "------------------------Select All Records------------------------------"
                                        echo "____________________________________________________________________"
                                        column -t -s ':' $tbName.type
                                        column -t -s ':' $tbName
                                
                                        echo "______________________________________________________"
                                        echo "select again :"
                                        ;;


                                2)

                                   colname=`awk -F ":" '{if(NR==1) print $1}' $tbName`;

                                        read -p "Enter $colname: " value

                                        if [[ -z $value ]] ; then
                                                tput setaf 1
                                                echo "Empty Input"
                                                tput setaf 7
                                                . selectFromTable.sh
                                        else
                                                echo "------------------------------------------------------------"
                                       
                                          if [[ $value =~ [`cut -d':' -f1 $tbName | grep -x $value`] ]]; then
            
                                          rec_no=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$value'" ) print NR}' $tbName)

                                          echo $(awk 'BEGIN{FS=":";}{if ( NR == '$rec_no' ) print $0 }' $tbName)

                                                echo "_____________________________________"
                                                echo "select again :"
                                               fi 
                                        fi 
                                        ;;
                                
                                3)
                                        read -p "Enter Column Number To select : " value 

                                        while ! [[ $value =~ ^[1-9]+$ ]]
                                        do
                                                tput setaf 1
                                                read -p "Column Number Must be Integer : " value 
                                                tput setaf 7

                                        done

                                                cut -d':' -f$value $tbName.type
                                                cut -d':' -f$value $tbName
                                                echo "____________________________________________________________________________________"
                                                echo "select again :"
                                        ;;

                                4)
                                        . TableMenu.sh

                                        ;;

                                
                                *)     
                                        
                                        echo "Invalid Number"
                                        echo "select again :"
                                        ;;
                        esac
                done
        . selectFromTable.sh
        else
        echo $tbName Table Does Not Exits ;
        echo "________________________________________________________________________________"
        fi


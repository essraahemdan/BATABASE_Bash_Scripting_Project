echo "Enter Table Name To Drop: "
read table

if [[ -f "$table" ]]
then
	rm -i $table
	if [[ ! -f $table ]]
	then
    	echo "Deleted!"
	fi
else
	echo "There is no table with this name!"
	select val in "Press 1 To Type Another Name Of Table" "Press 2 To Back to Home"
	do
		case $REPLY in
			1) clear ; . dropTable.sh ; clear ; break;;
			2) clear ; . TableMenu.sh ; clear ; break;;
			* ) echo "Invalid choice"
		esac
	done
fi

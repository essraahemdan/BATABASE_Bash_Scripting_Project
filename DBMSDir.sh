clear
echo "Welcome to DataBase Application :)"
if [ -d DataBase ]
then
	cd DataBase
else
	mkdir DataBase
	cd DataBase
fi

. DBMenu.sh




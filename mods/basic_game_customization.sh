#!bin/bash

#Global variable declaration
difficulty=" "
numfloors=" "
numcoins=12

#Functionfor the menu interface
menu_interface(){
    clear
    echo "======================"
    echo "New Game"
    echo "Quit"
    read -p "Selection: " select
    if [[ $select == "Quit" ]] || [[ $select == "quit" ]]
    then
	exit 1
    elif [[ $select == "New Game" ]] || [[ $select == "new game" ]]
    then
	#Difficulty choosing
	echo "=================================================="
	echo "Choose difficulty: Normal Intermediate Insane"
	read dif
	if [[ $dif == "Normal" ]] || [[ $dif == "normal" ]]
	then
	    difficulty=1
	elif [[ $dif == "Intermediate" ]] || [[ $dif == "intermediate" ]]
	then
	    difficulty=1.5
	elif [[ $dif == "Insane" ]] || [[ $dif == "insane" ]]
	then
	    difficulty=2
	else
	    echo "Please choose a valid command."
	    read
	    menu_interface
	fi
	#Choosing the number of floors to go through
	echo "=================================================="
	echo -e "Choose the number of floors you wish to go through:\n10   20   50   100"
	read numfl
	numfloors=$numfl
    else
	echo "Please choose a valid command."
	read
	menu_interface
    fi
}

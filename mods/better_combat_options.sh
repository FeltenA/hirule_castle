#!bin/bash

#Global variable declaration
dmg=0
esc=0

#Function to detect input
better_combat_options(){
    input=$1
    #If player uses protect
    if [[ $input == "Protect" ]] || [[ $input == "protect" ]] || [[ $input == 3 ]]
    then
	dmg=$(echo "${enemie[3]}/2" | bc -l)
	dmg=${dmg%.*}
	player[8]=$((${player[8]}-$dmg))
    #If player uses escape
    elif [[ $input == "Escape" ]] || [[ $input == "escape" ]] || [[ $input == 4 ]]
    then
	hlt=$(echo "${player[8]}/2" | bc -l)
	hlt=${hlt%.*}
	player[8]=$((${player[8]}-$hlt))
	esc=1
    fi
}

#Function to print the messages for the protect and escape actions
better_combat_options_messages(){
    if [[ $ginput == "Protect" ]] || [[ $ginput == "protect" ]] || [[ $ginput == 3 ]]
    then
	echo -e "\nYou used protect!"
	echo -e "\n${enemie[0]} attacked and dealt $dmg damages!"
    elif [[ $ginput == "Escape" ]] || [[ $ginput == "escape" ]] || [[ $ginput == 4 ]]
    then
	echo -e "\nYou escaped!"
    fi
}

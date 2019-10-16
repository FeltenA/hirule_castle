#!/bin/bash

#Global variable declaration
rarity=0
ginput=" "
fight=1
numfight=0
select=" "
declare -a player
declare -a ennemie

#Function to select the rarity
rarity_selection(){
    rand=$((1 + RANDOM % 100))
    if [[ $rand -le 50 ]]
    then
	rarity=1
    elif [[ $rand -le 80 ]] && [[ $rand -gt 50 ]]
    then
	rarity=2
    elif [[ $rand -le 95 ]] && [[ $rand -gt 80 ]]
    then
	rarity=3
    elif [[ $rand -le 99 ]] && [[ $rand -gt 95 ]]
    then
	rarity=4
    else
	rarity=5
    fi
}

#Function to select the player
player_selection(){
    rarity_selection
    if [[ $rarity == 1 ]]
    then
	ply=2  #Link
    elif [[ $rarity == 2 ]]
    then
	ply=3  #Young Link
    elif [[ $rarity == 3 ]]
    then
	ply=4  #Sheik
    elif [[ $rarity == 4 ]]
    then
	ply=5  #Impa
    else
	ply=6  #Hylia
    fi
    #Save all the characteristics of the player
    #0=name, 1=max hp, 2=max mp, 3=str, 4=int, 5=res, 6=spd, 7=luck
    #8=dynamic hp, 9=dynamic mp, 10=race, 11=class
    players=$(cat players.csv | sed "${ply}q;d")
    player[0]=$(echo $players | cut -d "," -f 2)
    player[1]=$(echo $players | cut -d "," -f 3)
    player[2]=$(echo $players | cut -d "," -f 4)
    player[3]=$(echo $players | cut -d "," -f 5)
    player[4]=$(echo $players | cut -d "," -f 6)
    player[5]=$(echo $players | cut -d "," -f 7)
    player[6]=$(echo $players | cut -d "," -f 8)
    player[7]=$(echo $players | cut -d "," -f 9)
    player[8]=${player[1]}
    player[9]=${player[2]}
    player[10]=$(echo $players | cut -d "," -f 10)
    player[11]=$(echo $players | cut -d "," -f 11)
}

#Function to select the enemie
enemie_selection(){
    rarity_selection
    if [[ $rarity == 1 ]]
    then
	rdm=$((1 + RANDOM % 4))
	if [[ $rdm == 1 ]]
	then
	    ply=8  #Skulltula
	elif [[ $rdm == 2 ]]
	then
	    ply=11  #Octorock
	elif [[ $rdm == 3 ]]
	then
	    ply=12  #Deku Scrub
	else
	    ply=13  #Bokoblin
	fi
    elif [[ $rarity == 2 ]]
    then
	rdm=$((1 + RANDOM % 2))
	if [[ $rdm == 1 ]]
	then
	    ply=7  #Lizalfos
	else
	    ply=10  #Gibdo
	fi
    elif [[ $rarity == 3 ]]
    then
	rdm=$((1 + RANDOM % 2))
	if [[ $rdm == 1 ]]
	then
	    ply=2  #Dead Hand
	else
	    ply=9  #Golden Skulltula
	fi
    elif [[ $rarity == 4 ]]
    then
	rdm=$((1 + RANDOM % 2))
	if [[ $rdm == 1 ]]
	then
	    ply=4  #Stalfos
	else
	    ply=5  #Darknuts
	fi
    else
	$rdm$((1 + RANDOM % 2))
	if [[ $rdm == 1 ]]
	then
	    ply=3  #Lynel
	else
	    ply=6  #Guardian
	fi
    fi
    #Save all the characteristics of the enemie
    #0=name, 1=max hp, 2=max mp, 3=str, 4=int, 5=res, 6=spd, 7=luck
    #8=dynamic hp, 9=dynamic mp, 10=race, 11=class
    enemies=$(cat enemies.csv | sed "${ply}q;d")
    enemie[0]=$(echo $enemies | cut -d "," -f 2)
    enemie[1]=$(echo $enemies | cut -d "," -f 3)
    enemie[2]=$(echo $enemies | cut -d "," -f 4)
    enemie[3]=$(echo $enemies | cut -d "," -f 5)
    enemie[4]=$(echo $enemies | cut -d "," -f 6)
    enemie[5]=$(echo $enemies | cut -d "," -f 7)
    enemie[6]=$(echo $enemies | cut -d "," -f 8)
    enemie[7]=$(echo $enemies | cut -d "," -f 9)
    enemie[8]=${enemie[1]}
    enemie[9]=${enemie[2]}
    enemie[10]=$(echo $enemies | cut -d "," -f 10)
    enemie[11]=$(echo $enemies | cut -d "," -f 11)
}

#Function to select the boss
boss_selection(){
    rarity_selection
    if [[ $rarity == 1 ]]
    then
	ply=2  #Ganon
    elif [[ $rarity == 2 ]]
    then
	ply=8  #Gohma
    elif [[ $rarity == 3 ]]
    then
	rdm=$((1 + RANDOM % 2))
	if [[ $rdm == 1 ]]
	then
	    ply=3  #Gleeoks
	else
	    ply=6  #Odolwa
	fi
    elif [[ $rarity == 4 ]]
    then
	 rdm=$((1 + RANDOM % 2))
	 if [[ $rdm == 1 ]]
	 then
	     ply=4  #Volvagia
	 else
	     ply=7  #Stallord
	 fi
    else
	ply=5  #Onox
    fi
    #Save all the characteristics of the bosses.
    #0=name, 1=max hp, 2=max mp, 3=str, 4=int, 5=res, 6=spd, 7=luck
    #8=dynamic hp, 9=dynamic mp, 10=race, 11=class
    bosses=$(cat bosses.csv | sed "${ply}q;d")
    enemie[0]=$(echo $bosses | cut -d "," -f 2)
    enemie[1]=$(echo $bosses | cut -d "," -f 3)
    enemie[2]=$(echo $bosses | cut -d "," -f 4)
    enemie[3]=$(echo $bosses | cut -d "," -f 5)
    enemie[4]=$(echo $bosses | cut -d "," -f 6)
    enemie[5]=$(echo $bosses | cut -d "," -f 7)
    enemie[6]=$(echo $bosses | cut -d "," -f 8)
    enemie[7]=$(echo $bosses | cut -d "," -f 9)
    enemie[8]=${enemie[1]}
    enemie[9]=${enemie[2]}
    enemie[10]=$(echo $bosses | cut -d "," -f 10)
    enemie[11]=$(echo $bosses | cut -d "," -f 11)
}

#Function to display the hp bar.
display_health(){
    maxhealth=$1
    dynhealth=$2
    echo -n "HP: "
    i=0
    while [[ $i -lt $(( $dynhealth*60/$maxhealth )) ]]
    do
	echo -n "I"
	i=$(($i+1))
    done
    while [[ $i -lt 60 ]]
    do
	echo -n "_"
	i=$(($i+1))
    done
    echo " $dynhealth / $maxhealth"
}

#Function to display the health.
combat_health_display(){
    clear
    echo "=========== FIGHT $fight ==========="
    echo -e "\033[31m${enemie[0]}\033[0m"
    display_health ${enemie[1]} ${enemie[8]}
    echo -e "\n\033[32m${player[0]}\033[0m"
    display_health ${player[1]} ${player[8]}
}

#Function to display the combat
combat_display(){
    combat_health_display
    echo $ginput
    if [[ ${player[8]} -gt 0 ]] && [[ ${enemie[8]} -gt 0 ]]
    then
	echo -e "\n---Options------------------\n1. Attack   2.Heal"
    fi
    if [[ $ginput == 1 ]] || [[ $ginput == Attack ]] || [[ $ginput == attack ]]
    then
	echo -e "\nYou attacked and dealt ${player[3]} damages!"
    elif [[ $ginput == 2 ]] || [[ $ginput == Heal ]] || [[ $ginput == heal ]]
    then
	 echo -e "\nYou used heal!"
    fi
    if [[ ${enemie[8]} -le 0 ]]
    then
	echo -e "\n${enemie[0]} died!"
    else
	echo -e "\n${enemie[0]} attacked and dealt ${enemie[3]} damages!"
    fi
}

#Function to do the combat actions
combat_turn(){
    read input
    ginput=$input
    if [[ $input == 1 ]] || [[ $input == Attack ]] || [[ $input == attack ]]
    then
	enemie[8]=$((${enemie[8]}-${player[3]}))
    elif [[ $input == 2 ]] || [[ $input == Heal ]] || [[ $input == heal ]]
    then
	player[8]=$((${player[8]}+${player[1]}/2))
	if [[ ${player[8]} -gt ${player[1]} ]]
	then
	   player[8]=${player[1]}
	fi
    fi
    if [[ ${enemie[8]} -gt 0 ]]
    then
	player[8]=$((${player[8]}-${enemie[3]}))
    fi
    fight=$(($fight+1))
    combat_display
}

#Function to effectuate the combat
combat_encounter(){
    fight=1
    if [[ $numfight -lt 9 ]]
    then
	enemie_selection
    fi
    #First combat display
    combat_health_display
    echo -e "\n---Options------------------\n1. Attack   2.Heal"
    echo -e "\nYou encounter a ${enemie[0]}."
    while [[ ${player[8]} -gt 0 ]] && [[ ${enemie[8]} -gt 0 ]]
    do
	combat_turn
    done
    #Final combat display
    combat_health_display
    if [[ ${player[8]} -le 0 ]]
    then
        echo -e "You died.\n"
	exit 1
    else
	echo -e "${enemie[0]} died.\n"
	read
    fi
}

#Function to display the menu
menu_interface(){
    clear
    echo "======================"
    echo "To start your adventure write start!"
    read -p "Selection: " select
}

#Main
menu_interface
if [[ $select == Start ]] || [[ $select == start ]]
then
    player_selection
    while [[ $numfight -lt 9 ]]
    do
	combat_encounter
	numfight=$(($numfight+1))
    done
    boss_selection
    combat_encounter
    echo -e "\n\nYou won, you defeated the boss of the castle and won all its treasures.\n\n\n"
fi

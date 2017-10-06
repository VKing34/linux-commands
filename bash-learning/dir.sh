#!/bin/bash


#colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
transparent="\e[0m"

#ExitMode
trap exitMode SIGINT SIGHUP
function exitMode {
	
	echo -e -n "${red}Exit ..."
	sleep 2
	clear
	exit
}

#Design
function top(){
	echo -e "$green#########################################################"
	echo -e "$green#                                                       #"
  	echo -e "$green#       $red               FILE MENU             "      	   ${green}"          #"
	echo -e "$green#                     "${yellow} by "${red}V""${yellow}king""${red}"34" 	               "    ${green}#""
	echo -e "$green#                                                       #"
	echo -e "$green#########################################################""$transparent"
	echo
	echo
}

function menu
{
	while true; do
	clear
	top
	echo	-e "   ""${green}1""$transparent"". Create a directory"
	echo	-e "   ""${red}2""$transparent"". Delete a directory"
	echo 	-e "   ""${blue}3""$transparent"". Show the permission of a directory"
	echo	-e "   ""${white}4""$transparent"". Exit"
	echo -n '#> '
	read choice
	echo ""
	case $choice in 
		1 ) create; break;;
		2 ) delete; break;;
		3 ) show; break;;
		4 ) exitMode; break;;
		* ) echo -e "${red}- Are you kidding me or You are f**king blind ?"; sleep 2;
	esac
	done
}


function create
{
echo -n -e "${green}1""$transparent"". Enter name of directory: "
read name
if [ -d "$name" ]; then
echo -e "+""$red $name""$transparent"" exists !!!"
sleep 2
else
mkdir $name
echo -e "+""$green $name""$transparent"" was created successful !"
sleep 2
fi
menu
}


function delete
{
echo -n -e "${red}2""$transparent"". Enter name of directory: "
read name
if [ ! -d "$name" ]; then
echo -e "+""$white $name""$transparent"" doesn't exist !!!"
sleep 2
else
sudo rm -rf $name
echo -e "+""$red $name""$transparent"" was deleted sucessfully !"
sleep 2
fi
menu
}


function show
{
echo -n -e "${blue}3""$transparent"". Enter name of directory: "
read name
if [ ! -d "$name" ]; then
echo -e "+""$red $name""$transparent"" doesn't exist !!!"
sleep 2
else
getfacl $name
fi
read -n 1 -s -p "Press any key to continue..."

menu
}



clear; menu


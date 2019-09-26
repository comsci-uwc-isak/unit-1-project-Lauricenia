#!/bin/bash

#This file creates the folder structure for the
#minimal car rental app 

echo "Starting installation"
echo "Enter the desired path to install the app.Press enter"

#Moving to the desired directory

Read path

cd $path

echo "$PWD"
	if [ $path != $PWD ]; then 
		echo "Error creating the folder structure  
	fi

#Creating the App folder 

mkdir RentalCarApp

#moving to the App folder
cd RentalCarApp

#Creating folders for the database and the script 
mkdir db
mkdir script  

echo "Installation completed sucessfully"

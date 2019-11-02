![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

 <details><summary>Planning</summary>

Definition of the problem
=========================
My client is an onwer of a car rental bussiness. His company has a range of cars availbale for rent on a price that varies on the hours of use of the car. The owner requests a computer program for recording information about their orders with the purpose of collecting basic information about the distance driven for each car and points out specific features: easy commands to allow to create a car, record a trip distance, query the trip history a car, edit, delete a car and see the total statistics. One more requirement of the client was a simple terminal based program with a simple and transparent installation. Theres no reference to prior experience with a computer system program. 

Proposed Solution
=====================
Since we dont know about any prior experience of the stakeholders with a computer system, we have to follow all the requirements given by the client entirely and successfully because we assume they must be according the stakeholders capacities and the technology present in the company. To make the installation easy and clear, its necessary to use a sotware system that already has the chosen terminal to reduce the work of going through its instalation, which would make the process of installing the app less simple and longer. I chose to work on bash because I am familiar with it, its a free software that can be found in most operating systems except for window bases. These include a lot of linux distributions, macs ls, ios, android among otherrs. It can generate txt files and has the man page feature. 
Git Hub was used to record all the steps in the process of creating the Car Rental App. This helps in the organization to keep on track on what is done and what needs to be done. 
  https://techterms.com/definition/bash
  https://devdocs.io/bash/html_node/bash-features#Bash-Features

Sucess Criteria
===================
  These are the measurable outcomes :

1. A car can be created and stored in the database
1. A trip can be recorded for a given car
1. A summary (total distance traveled) of trips can be measured for a particular car
1. A car information can be edited
1. A basic backup system is available
1. Installation is simple-> it does not require additional software, one step process
1. A car can be deleted
1. The application can be uninstalled 
 <p></details>
 

 <details><summary>Design</summary>
  
System diagram
=======================
 To design the system diagram of the car rental app we followed the requirements of the client for the desirable outcomes. 
 The input of data will be made through a bash terminal using the scripts that we will be uploaded together with the Car Rental App through installation. The data will be directed to the database file tha is also within the Car Rental App folder.
 Our scripts comprehend 8 actions that will be afterwards explained in the development section: create, record, edit,delete, summary, backup and uninstall.
 
 ![Diagram](Systemdiagram.png)
  
 [Fig1][This picture shows the system diagram for the car rental program]


Algorithms flow diagram
==========================

Create function flowchart 
----------------

![Diagram](createcar.png)
[fig2][This picture shows the flowchart of the create function]

Record function flowchart
-----------

![Diagram](recordcar.jpn)
[fig3][This picture shows the flowchart of the record function]

Edit function flowchart
-----------

![Diagram](editcar.jpn)
[fig4][This picture shows the flowchart of the edit function]

Test plan
================
 testing plan
  program---expected outcome
<p></details> 

  
<details><summary>Development</summary>
  
Installation
====================

The installation function creates the app's main folder and its components: database folder and scripts folder 

```.sh
#!/bin/bash

#This file creates the folder structure for the
#minimal car rental app 

echo "Starting installation"


#Moving to the desired directory
cd ~/Desktop

#Creating the App folder 
mkdir CarRentalApp

#moving to the App folder
cd CarRentalApp

#Creating folders for the database and the script 
mkdir database  

cp -r ~/Desktop/CarApp/scripts ~/Desktop/CarRentalApp/
echo "Installation completed sucessfully"

```
problems and solutions
----------------------
In the first draft of the script, the user had to add the location for the installation of the app but since we dont know if the user knows how to write paths, I had to set a location and I chose desktop because its the most acessible location.
The first draft also did not have the feature of creating a scripts file containing all the application's funtions. This was solved by creating an installation folder that contained the all scripts inside a folder and adding a section the installation script to copy this folder to the app's main folder.


Creat
==================
  
The create function creates a car file and records the car's details in the maincarfile.txt file.

The following steps summarize the algorithms to create a new car in the system:
  
1. Get input from the user 
1. Check number of arguments (model, color, pp). If 4 then continue, if not "message", exit. 
1. Write to main file with one extra line. Not erasing other entries. 
1. Create car trip file with 4 case for the 4 arguments plate.txt


```.sh
#!/bin/bash
 
#This program creates a car and record the orders of a car rental bussiness 

#Create a car
#Check number of arguments
if [ $# -ne 4 ]; then
echo " Incomplete input. Please enter Plate, Model, Colour and PP "
exit

else
 
#If number of arguments is correct. Continue
plate=$1
model=$2
color=$3
pp=$4

#Record order
#moving to the directory where we can find the db file inside the RentalCarApp
#folder. Now we are inside the scripts file, so we will move one level up.
cd ../database

#Adding new entry to the file maincarfile.txt without erasing.
echo "$plate $model $color $pp" >> maincarfile.txt
#creating 
echo " " > $plate.txt

cd ../scripts
#presenting the results in a frame
bash frame1.sh "Car Created successfully"

fi
```
[This script shows the algorithms for creating the car]

problems and solutions: 
-----------------
The frame was not showing. This was solved by specfiying the location of the frame script.


Record
==========================
The record function stores a car's trip information in the car's file.
 The following steps summarize the algorithms to record trip info:
  
1. Check arguments (Plate, km,Date-out,Date-in) if 4, then continue, if not "message", exit.
1. Check that the car exists.
1. If car exists then write the trip info in the $plate.txt file, without erasing previous trips.

```.sh 
#!/bin/bash

#Check if arguments are complete
if [ $# -ne 4 ]; then
echo " The arguments are not complete. Enter Plate, Km, Date-out and Date-in "
exit 
fi

plate=$1
km=$2
dateout=$3
datein=$4

cd ../database
if [ ! -f $plate.txt ]; then
echo "This car was not created"
exit
else 
echo "$km $dateout $datein" >> $plate.txt
fi

cd ../scripts
bash frame1.sh "Trip info recorded successfully" 
```
[This script shows the algorith for recording a car trip]


Edit
==================
The edit function edits a car's details stored in the maincarfile.txt file.
The following steps summarize the algorithms to edit a car info:
1. Check the number of arguments. If not equal to 4, then print "message" and exit
1. atribute variables to the arguments
1. move to the database file to locate the car file
1. check if car file exists. If not, then print "message" and exit. Else, copy the arguments to the car file.
1. move to the script file to locate the frame script
1. show results in frame script
  
```.sh
 #!/bin/bash

#This program edits the recorded information of existing car in the 
#maincarfile


#Check if the number of arguments equals to 4
if [ $# -ne 4 ]; then
echo "Error with the number of arguments"
echo "Enter License Model colour and passengers"
exit
fi


#atributing variables
plate=$1
model=$2
colour=$3
pp=$4

#moving to the database
cd ../database

#checking if car exists
if [ ! -f $plate.txt ]; then
echo "Car does not exit"
fi

#find the line and replace the wrong information with the new one
sed -i '' "/$plate/d" maincarfile.txt

#add the new information 
echo " $plate $model $colour $pp " >> maincarfile.txt

#moving to the scripts
cd ../scripts

#presenting the results
bash frame1.sh "Car edited successfully"
```
[This scripts shows the algorithms to edit a car info]

Problems and solutions
-----------------
The old version being replaced was not being erased. This problem was solved by adding ``.sh '' `` in the line: ``.sh sed -i '' "/$plate/d" maincarfile.txt ``

Delete 
==============
The delete function deletes a car's file and its record in the maincarfile.txt file.
  The following steps summarize the algorithms to delete a car:
1. Check the existance and number of arguments. If not equal to one, then print "message" and exit. If yes, continue.
1. atribute a variable to the first argument
1. move to the database directory to locate the car file
1. check if car exists. If not, then print "message" and exit. Else, delete the car file and delete the car info in the main car file 
1. Show results in frame
  
```.sh
#!/bin/bash

#This program deletes a created car

plate=$1

#First we check the number of arguments 
if [ $# -ne 1 ]; then
echo " No input. Please restart and enter the name of the car. "
exit
fi

#move to the Car Rental App main folder
cd ../database

#Check if car exists
if [ ! -f $plate.txt ]; then
echo " This car does not exist."
exit

else

#delete car
rm $plate.txt

 
#delete line of the car in the maintext.file
sed -i '' "/$plate/d" maincarfile.txt

cd ../scripts

#showing the results
bash scripts/frame1.sh "Car deleted successfully" 

fi
 
```
[The above script shows the algorithms to delete a car]


Summary 
=============
The summary fucntion displays the total distance travelled by a car.
  The following steps summarize the algorithms to generate the summary of a car:

1. Check the number of arguments. If 1 continue, if not "message", exit.
1. Check if the car exists. If yes continue, if not "message", exit.
1. Read the record trips in the car license and for the first word in line (km)
do summary for all if $1 arg =all

```.sh 
#!/bin/bash

#This script generates the summary of the car

bash frame1.sh Summary

#Check if the user inputs any argument (check number of arguments) 
if [ $# -ne 1 ]; then
echo "No argument inputed.Run the program again and enter the car license"
exit
fi


#Check if file exists in database
car=$1

#move to the desirable directory 
cd ../database

#Another option is moving to the database before checking the file
if [ ! -f $car.txt ]; then
 echo " Car not created. $car does not exist in the database "
 exit
fi

#Summary of the car 
total=0

while read line; 
do

#Show the sum of the km
for km in $line 
do 
  (( total=$total+$km ))
break
done

done < car.txt

#Step 4: Show result nicely 
cd ../scripts/
bash frame1.sh "Total distance travelled for $car was $total"
```

Backup
===============
The backup function creates a backup file and copies the database folder from the App main folder.
The following steps summarize the algorithms to backup the data in the Car Rental App:
1. Check the existance and number of arguments. If not equal to 1 then print "message", exit, else :
   1. cope the Car Rental App into a destination input by the user
   2. change the name to one that specifies the day of the backup
   3. show the results  
  
```.#!/bin/bash

#this program backs up the Rental Car app data into a directory chosen by the
#user

cp -a ~/Desktop/RentalCarApp/database ~/Desktop/BACKUP
echo "Successfully backed up into Desktop."

cd ../scripts
bash frame1.sh "Backup was successfully"  

```
Problems and solutions
--------------------
The first backup script as the installation script also had the option of the letting the user input the location. This was changed by setting the desktop as the default location for the same reason as of the installation script.

Uninstall
==============
This function deletes the app's main folder as well as all the components within it.
``.sh
#!/bin/bash

#Go two levels up to get to the directory where our Car Rental File was 
#installed
cd ../..

#delete the app directory
rm -r RentalCarApp

``

Man pages
================

create
----------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

record
----------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

edit
-------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

backup
-------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

summary
--------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

delete
-------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque 

uninstall
----------
.TH man 6 "28t Oct 2019" "1.0" "car Rental App scripts man page"
.SH NAME
create \-create a new car 
.SH SYNOPSIS
bash create [license] [model] [color] [passengers]

.SH DESCRIPTION

.SH EXAMPLES
bash create LXH798 Mazda Red 3
 
.SH AUTHOR
Lauricenia Buque
<p></details>



Evaluation
----------------------

how this tests files show that the programs are working, type of tests

<details><summary>Test 1</summary>
1. First time running the program we had one issue: the test file needed to move to the main folder
  
```
  .sh
cd ../
```

This is necessary because the create.sh resids in the main folder whereas the test file is inside the /tests folders.

1. The second run of the the test file was also unsucessfull because the database folder was not existent. Also the created program did not store the license file inside the database 
<p></details>

<details><summary>Test 2</summary>
1. First we check if the car was added to the mainfile
In the shell script we used this line:
  
```
.sh
lastline= $( tail -n 1 Databse/maincarfile.txt )
```
The tail -n command is used to read the lines from the last one and the number (1) is the number of the lines that have to be read. Everything together is doing **read 1 line starting from the last one**
1. Then we compare the file we created for the test with the lastline in the maincarfile
1. We had an error because of not putting the quotation mark 
quotation marks makes the argument a phrase. Without the quotation mark the words will be read separetly not as a phrase and it might give tHE ERROR OF "too many arguments"

Recommendations for the future
======================================
In the end the program fullfilled all the sucess criteria, however through out the development of the program, I realised that a few other features should have been added to the program: 
1. Headers for the car.txt files and for the maincarfile.txt file: For an easy understanding of the data recorded, there should be a header for each row so that we know from looking which row corresponds to what. Eg.: 
Eg.: In a car.txt file

1. A feature to edit the cars trip info: The edit function available for this app only edits the cars details however its also possible for an error to occur when inputting the car trip info, for this reason its also important to have an edit option for the trip data.

1. There should be a feature to delete specific lines in the files, not only delete car. For example, in a case where I run the create script when I wanted to run the record script, I would make the error of storing the trip data in the maincarfile.txt file and if in this case I try to solve it by running the delete function, it would delete the car and all the data related to it, and this is a big risk of loss of data. 

1. A summary of a car should have more details. The actual summary function only shows the total distance travalled by the car but there are more revelant details that would be helpfull for the business,like, how many times was the car rented, the period of the year that it was most rented, or the average amount of time that it is usually rented for. 

1. The backup should be automatic and the database versions should have a backup dates name, eg.: BACKUP/database_04.04.2019 ( this backup was done in april 4th of 2019 ). One more thing that would improve the backup function is having the option of backing up in an external drive. In a case of an accident with the computer that would be the only way to recover the data.
summary : explain what type of testing was used (refer to the slides in )

compare the criteria with the result, evidence for the succes criteria 
move the test files to development 
<p></details>


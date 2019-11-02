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


Record function flowchart
-----------

![Diagram](recordcar.jpn)

Edit function flowchart
-----------

![Diagram](editcar.jpn)


Test plan
================
 testing plan
  program---expected outcome
<p></details> 

  
<details><summary>Development</summary>

Creating a new car function
==================
  
The create script has the function of 
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
fi

#If number of arguments is correct. Continue
plate=$1
model=$2
color=$3
pp=$4

#Record order
#moving to the directory where we can find the db file inside the RentalCarApp
#folder. Now we are inside the scripts file, so we will move one level up.
cd ..
#Adding new entry to the file maincarfile.txt without erasing.
echo "$plate $model $color $pp" >> db/maincarfile.txt
#creating
echo " " > db/$plate.txt

bash script/frame1.sh "Car Created successfully"
```
[This script shows the algorithms for creating the car]


Recording the trip 
==========================

 The following steps summarize the algorithms to record trip info:
  
1. Check arguments (Plate, km,Date-out,Date-in) if 4, then continue, if not "message", exit.
1. Check that the car exists.
1. If car exists then write the trip info in the $plate.txt file, without erasing previous trips.

```.sh 
#!/bin/bash

plate=$1
km=$2
dateout=$3
datein=$4

#Check if arguments are complete
if [ $# -ne 4 ]; then
echo " The arguments are not complete. Enter Plate, Km, Date-out and Date-in "
exit
fi

plate=$1
km=$2
dateout=$3
datein=$4

cd ../db
if [ ! -f $plate.txt ]; then
echo "This car was not created"
exit
else
echo "$km $dateout $datein" >> $plate.txt
fi

cd ../script
bash frame1.sh "Trip info recorded succesfully"
```
[This script shows the algorith for recording a car trip]


Editing a cars details
==================

The following steps summarize the algorithms to edit a car info:
1. Check the number of arguments. If not equal to 4, then print "message" and exit
1. atribute variables to the arguments
1. move to the database file to locate the car file
1. check if car file exists. If not, then print "message" and exit. Else, copy the arguments to the car file.
1. move to the script file to locate the frame script
1. show results in frame script
  
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

cd ../db
if [ ! -f $plate.txt ]; then
echo "This car was not created"
exit
else
echo "$km $dateout $datein" >> $plate.txt
fi

cd ../script
bash frame1.sh "Trip info recorded succesfully"
```
[This scripts shows the algorithms to edit a car info]


Delete car
==============

  The following steps summarize the algorithms to delete a car:
1. Check the existance and number of arguments. If not equal to one, then print "message" and exit. If yes, continue.
1. atribute a variable to the first argument
1. move to the database directory to locate the car file
1. check if car exists. If not, then print "message" and exit. Else, delete the car file and delete the car info in the main car file 
1. Show results in frame
  
```.sh
#!/bin/bash

#This program deletes a created car

#First we check the number of arguments
if [ $# -ne 1 ]; then
echo " No input. Please restart and enter the name of the car. "
exit
fi

plate=$1

#move to the Car Rental App main folder
cd ../db

#Check if car exists
if [ ! -f $plate.txt ]; then
echo " This car does not exist."
exit

else

#delete car
rm db/$plate.txt


#delete line of the car in the maintext.file
sed -i '' "/$plate/d" db/maincarfile.txt

#showing the results
bash script/frame1.sh "Car deleted successfully"

fi
```
[The above script shows the algorithms to delete a car]


Summary 
=============
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
FILE=$1
#Another option is moving to the database before checking the file
if [ ! -f "../db/$FILE.txt" ]; then
 echo " Car not created. $FILE does not exist in the database "
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

done < ../db/$FILE.txt

#Step 4: Show result nicely
cd ../script/
bash frame1.sh "Total distance travelled for $FILE was $total"
exit
```

Backup
===============

The following steps summarize the algorithms to backup the data in the Car Rental App:
1. Check the existance and number of arguments. If not equal to 1 then print "message", exit, else :
   1. cope the Car Rental App into a destination input by the user
   2. change the name to one that specifies the day of the backup
   3. show the results  
  
```.sh 
#!/bin/bash

#this program backs up the Rental Car app data into a directory chosen by the
#user

destination=$1

if [ $# -ne 1 ]; then
echo "Sorry, no destination was inputed. Try again"
exit

else

date=date+%D
cp -a ~/Desktop/RentalCarApp/db $destination
mv $destination/db $destination/db-$date
echo "Successfully backed up into $destination."
fi
```
[The above script shows the algorithms to backup the Car Rental App data]
<p></details>

man pages 
documentations of problems/evolutions fared

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

1. The backup should be automatic and the database versions should have a backup dates name, eg.: BACKUP/database_04.04.2019 ( this backup was done in april 4th of 2019 )
summary : explain what type of testing was used (refer to the slides in )

compare the criteria with the result, evidence for the succes criteria 
move the test files to development 
<p></details>


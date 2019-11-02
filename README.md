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

Planning
---------- 
 <details><summary>Definition of the problem</summary>
My client is an onwer of a car rental bussiness. His company has a range of cars availbale for rent on a price that varies on the hours of use of the car. The owner requests a computer program for recording information about their orders with the purpose of collecting basic information about the distance driven for each car and points out specific features: easy commands to allow to create a car, record a trip distance, query the trip history a car, edit, delete a car and see the total statistics. One more requirement of the client was a simple terminal based program with a simple and transparent installation. Theres no reference to prior experience with a computer system program. 
 <p></details>

 <details><summary>Proposed Solution</summary>
Since we dont know about any prior experience of the stakeholders with a computer system, we have to follow all the requirements given by the client entirely and successfully because we assume they must be according the stakeholders capacities and the technology present in the company. To make the installation easy and clear, its necessary to use a sotware system that already has the chosen terminal to reduce the work of going through its instalation, which would make the process of installing the app less simple and longer. I chose to work on bash because I am familiar with it, its a free software that can be found in most operating systems except for window bases. These include a lot of linux distributions, macs ls, ios, android among otherrs. It can generate txt files and has the man page feature. 
Git Hub was used to record all the steps in the process of creating the Car Rental App. This helps in the organization to keep on track on what is done and what needs to be done. 
  https://techterms.com/definition/bash
  https://devdocs.io/bash/html_node/bash-features#Bash-Features
  <p></details>
 
 <details><summary>Sucess Criteria</summary>
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
 
Design
---------
 <details><summary>System Diagram</summary>
  ![SystemDiagram]() 
  [Fig1][This picture shows the system diagram for the car rental program]
  
 
 To design the system diagram of the car rental app we followed the requirements of the client for the desirable outcomes. 
 The input of data will be made through a bash terminal using the scripts that we will be uploaded together with the Cra Rental App through installation. The data will be directed to the database file tha is also within the Car Rental App folder.
 Our scripts comprehend 8 actions that will be afterwards explained in the development section: create, record, edit,delete, summary, backup and uninstall.
<p></details> 

<details><summary>Algorithms flow diagram</summary>
create 
record
summarize
<p></details> 

<details><summary>Test plan</summary>
 testing plan
  program---expected outcome
<p></details> 

Development
----------
  
<details><summary>Creating a new car function</summary>
  
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
<p></details>


<details><summary>recording the trip information</summary>
 The following steps summarize the algorithms to record trip info:
  
1. Check arguments (Plate, km,Date-out,Date-in) if 4, then continue, if not "message", exit.
1. Check that the car exists.
1. If car exists then write the trip info in the $plate.txt file, without erasing previous trips.

```
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
<p></details>

<details><summary>Editing a recorded data</summary>
   The following steps summarize the algorithms to edit a car info:
1. Check the number of arguments. If not equal to 4, then print "message" and exit
1. atribute variables to the arguments
1. move to the database file to locate the car file
1. check if car file exists. If not, then print "message" and exit. Else, copy the arguments to the car file.
1. move to the script file to locate the frame script
1. show results in frame script
  
```
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
<p></details>
  
  
<details><summary>Delete</summary>
  The following steps summarize the algorithms to delete a car:
1. Check the existance and number of arguments. If not equal to one, then print "message" and exit. If yes, continue.
1. atribute a variable to the first argument
1. move to the database directory to locate the car file
1. check if car exists. If not, then print "message" and exit. Else, delete the car file and delete the car info in the main car file 
1. Show results in frame
  
```
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
<p></details>


<details><summary>Summary</summary>
  The following steps summarize the algorithms to generate the summary of a car:

1. Check the number of arguments. If 1 continue, if not "message", exit.
1. Check if the car exists. If yes continue, if not "message", exit.
1. Read the record trips in the car license and for the first word in line (km)
do summary for all if $1 arg =all

```
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
<p></details>

<details><summary>backup</summary>
The following steps summarize the algorithms to backup the data in the Car Rental App:
1. Check the existance and number of arguments. If not equal to 1 then print "message", exit, else :
   1. cope the Car Rental App into a destination input by the user
   2. change the name to one that specifies the day of the backup
   3. show the results  
  
```
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

summary : explain what type of testing was used (refer to the slides in )

compare the criteria with the result, evidence for the succes criteria 
recommendations for the future 
move the test files to development 
<p></details>


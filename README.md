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
Since we dont know about any prior experience of the stakeholders with a computer system, we have to follow all the requirements given by the client entirely and successfully because we assume they must be according the stakeholders capacities and the technology present in the company. To make the installation easy and clear, its necessary to use a sotware system that already has a terminal to reduce the work of going through its instalation, which would make the process of installing the app less simple and longer.
 <p></details>
 
 <details><summary>Sucess Criteria</summary>
  These are the measurable outcomes :

1. A car can be created and stored in the database
1. A trip can be recorded for a given car
1. A summary (total distance travel, average) of trips can be measured for a particular car
1. A car information can be edited
1. A basic backup system is available
1. The user can easily understand the commands by the straigtforward comments and instructions 
1. Installation is simple-> it does not require additional software, one step process
1. A car information can be deleted
1. The application can be uninstalled 
 <p></details>
 
Design
---------
 <details><summary>System Diagram</summary>
  ![SystemDiagram]() 
  [Fig1][This picture shows the system diagram for the car rental program]
  
<p></details> 

Development
----------
  
 <details><summary>Creating a new car function</summary>
 The following steps summarize the algorithms to create a new car in the system:
  
1. Get input from the user 
1. Check number of arguments (model, color, pp). If 4 then continue, if not "message", exit. 
1. Write to main file with one extra line. Not erasing other entries. 
1. Create car trip file with 4 case for the 4 arguments plate.txt
  <p></details>

<details><summary>recording the trip information</summary>
 The following steps summarize the algorithms to record trip info:
  
1. Check arguments (Plate, km,Date-out,Date-in) if 4, then continue, if not "message", exit.
1. Check that the car exists.
1. If car exists then write the trip info in the $plate.txt file, without erasing previous trips.
<p></details>

<details><summary>Summary</summary>
  The following steps summarize the algorithms to generate the summary of a car:

1. Check the number of arguments. If 1 continue, if not "message", exit.
1. Check if the car exists. If yes continue, if not "message", exit.
1. Read the record trips in the car license and for the first word in line (km)
do summary for all if $1 arg =all
<p></details>

Evaluation
-----------

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
<p></details>


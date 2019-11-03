#!/bin/bash

word=$1
length=${#word}
width=100
padding=2
((spaces1=$width-2))
((spaces2=$width/2-$length/2))

#1st line
for ((i=1; i<=$width; i++))
do
	echo -n "x"
done


echo " "


#2nd line
for ((p=1; p<=padding; p++))
do
	echo -n "x"

    for ((s1=1; s1<=$spaces1; s1++))
    do
        echo -n " "
    done

done


echo " "


#3rd line
echo -n "x"

    for ((s2=1; s2<$spaces2; s2++))
    do 
        echo -n " "   
    done

echo -n $word

     for ((s2=1; s2<$spaces2-1; s2++))
     do
         echo -n " "
     done

eq=`expr $length % 2`
if [ $eq -eq 0 ]; then
echo -n " "
fi 

echo -n "x"

echo " "


#4th line
for ((p=1; p<=padding; p++))
do
        echo -n "x"

    for ((s1=1; s1<=$spaces1; s1++))
    do
        echo -n " "
    done

done


echo " "


#5th line

for ((i=1; i<=$width; i++))
do
        echo -n "x"
done

echo " "


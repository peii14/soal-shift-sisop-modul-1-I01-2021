#!bin/bash
#set todays date and take the day from the year count 
today=$(date '+%d-%m-%y')
day=$(date +"%--j")

echo $today
#if ther is no kucing folder for this day and the day is even
if [ ! -d "kucing_$day" ]&&[ $(($day%2)) -eq 0 ]
then 	
	#create the folder download kitten and move it to the directory that are made
	mkdir -p "kucing_$today"
	wget --output-document "$day.jpg" "https://loremflickr.com/320/240/kitten"
        mv "$day.jpg" "kucing_$today/"
#when kelinci folder for this day is not reated and day is odd
elif [ ! -d "kelinci_$day" ]&&[ $(($day%2)) -ne 0 ]
then
	#create the folder download bunny and move it to kelinci this day folder
	mkdir -p "kelinci_$today"
	wget --output-document "$day.jpg" "https://loremflickr.com/320/240/bunny"
        mv "$day.jpg" "kelinci_$today/"
fi

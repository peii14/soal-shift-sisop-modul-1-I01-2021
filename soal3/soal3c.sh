#!bin/bash
today=$(date '+%d-%m-%y')
day=$(date +"%--j")

echo $today

if [ ! -d "kucing_$day" ]&&[ $(($day%2)) -eq 0 ]
then 
	mkdir -p "kucing_$today"
	wget --output-document "$day.jpg" "https://loremflickr.com/320/240/kitten"
        mv "$day.jpg" "kucing_$today/"

elif [ ! -d "kelinci_$day" ]&&[ $(($day%2)) -ne 0 ]
then
	mkdir -p "kelinci_$today"
	wget --output-document "$day.jpg" "https://loremflickr.com/320/240/bunny"
        mv "$day.jpg" "kelinci_$today/"
fi

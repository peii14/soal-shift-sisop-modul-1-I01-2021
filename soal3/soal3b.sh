#!bin/bash

#directory naming
	#take date from log file by awk
	date=$(tail -1 Foto.log | awk '{print $1}' Foto.log )
	
	#take year start from 1 char add by 5 char from 1
	yr=${date:1:5}
	
	#take month start from 6 char add by 3 from 6
        mo=${date:6:3}
	
	#take day from 10 char add by 2 from 10
        dy=${date:10:2}

        #printf "%s%s%s\n" $dy $mo $yr
	#set directory name
	director="$dy$mo$yr"
	
	printf "%s\n" $director
	
	#initiate status of the folder
	status=false
	#if folder didnt exit create one and set status as true
	if [[ ! -d "$director" ]]
        then
                mkdir -p "$director"
		status=true
        fi
#loop for total number of image
for ((iter=1;iter<=23;iter=iter+1))
do	
	#if the directory exist and status is strue move to the folder
	if [  "$status" = "true" ]&&[ -d "$director" ]
	then
		mv "Kumpulan_$iter.jpg" "$director/"
		#echo $status
	#when its false it means that the folder is already exist before
	else
		echo "SKIP PROCESS. ALREADY EXIST"
	fi
done 

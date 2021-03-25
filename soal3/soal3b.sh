#!bin/bash

#nama file
	date=$(tail -1 Foto.log | awk '{print $1}' Foto.log)
        yr=${date:1:5}
        mo=${date:6:3}
        dy=${date:10:3}
        #printf "%s%s%s\n" $dy $mo $yr


for ((iter=1;iter<=23;iter=iter+1))
do	
	printf "%s%s%s\n" $dy $mo $yr	
done 

#!bin/bash

#nama dir
	date=$(tail -1 Foto.log | awk '{print $1}' Foto.log )
        yr=${date:1:5}
        mo=${date:6:3}
        dy=${date:10:3}
        #printf "%s%s%s\n" $dy $mo $yr
	director="${dy}${mo}${yr}"
	#printf "%s\n" $director


	if [[ ! -d "$director" ]]
        then
                mkdir -p "$director"
        fi

for ((iter=1;iter<=23;iter=iter+1))
do	
	#finalfile=$(ls $director/ | sort -V | tail -n 1)
	#filename=${finalfile%.*}	
	#lastfile=${filename:9}
	if [[ -d "$director" ]]
	then
		mv "Kumpulan_$iter.jpg" "$director/"
	fi
done 

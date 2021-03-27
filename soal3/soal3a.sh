#!bin/bash

#iterate 23 pictures
for ((iter=1; iter<=23; iter=iter+1))
do
	#start download from link save log into Foto.log
	wget --output-document "Kumpulan_$iter.jpg" -o "Foto.log" "https://loremflickr.com/320/240/kitten"
	#take the original name from the link
	filetemp=$(awk '/Location:/ {print $2}' Foto.log)
	#take only the name of the original jpg (ifs separator)
	IFS='/' read -ra ADDR <<< "$filetemp"
	#set file temp as original jpg
	filetemp=${ADDR[3]}

	#check if there such a file in the list. when it does delete
	#no need to compare on the first pict
	for element in "${list[@]}" 
	do
       	if [[ $element == "$filetemp" ]]&&[[ $iter > 1  ]]
	then
            	echo "Delete duplicate"
	    	rm -rf "Kumpulan_$iter.jpg"
           	break
        fi
  	done
	#appending list
	list+=($filetemp)

done

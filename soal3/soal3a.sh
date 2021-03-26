#!bin/bash

for ((iter=1; iter<=23; iter=iter+1))
do
	$(echo wget --output-document "Kumpulan_$iter.jpg" -o "Foto.log" "https://loremflickr.com/320/240/kitten")
	filetemp=$(awk '/Location:/ {print $2}' Foto.log)
	IFS='/' read -ra ADDR <<< "$filetemp"
	filetemp=${ADDR[3]}
	
	check=$(awk -v foto="$filetemp" '
	BEGIN{count=0}
	{if( $0~foto )count++}
       	END{print count}' Foto.log )
	echo $check


	if [[ $check>0 ]]
	then
		echo "DELETE DUPLICATE"
		rm -f "benerin_$iter.jpg"
	fi
done

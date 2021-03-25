#!bin/bash

for ((iter=1; iter<=23; iter=iter+1))
do
	$(echo wget --output-document "Kumpulan_$iter.jpg" -o "Foto.log" "https://loremflickr.com/320/240/kitten")
	filetemp=$(awk '/Location:/ {print $2}' Foto.log)
	IFS='/' read -ra ADDR <<< "$filetemp"
	filetemp=${ADDR[3]}

	cek=$(awk -v Koleksi="$filetemp" '
	BEGIN{counter=0}
	{if( $0~Koleksi )count++}
       	END{print count}')
	#echo $cek

	if [[ $cek>0 ]]
	then
		echo "DELETE DUPLICATE"
		lastF=$(ls | sort -V | tail -n 1)
		lastFname=${lastF%.*}
		finaliter=${lastF:10}
	#	rm -f "Koleksi_$iter.jpg"
	fi
done

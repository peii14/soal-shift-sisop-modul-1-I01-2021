#!bin/bash

#take date from lsat logdate
logdate=$(tail -1 Foto.log | awk '{print $1}' Foto.log )
yr=${date:1:5}
mo=${date:6:3}
dy=${date:10:2}
#printf "%s%s%s\n" $dy $mo $yr
logfolder="$dy$mo$yr"

#take all folder name kucing_* and kelinci_*
folderkucing=$(kucing_*)
folderkelinci=$(kelinci_*)

#set password into today date
password=$(date '+%m%d%Y')

echo $password
if [ ! -e ./Kumpulan.zip ]
then
	echo "zip file"
	# zip every folder with kumpulan name and exclude sh log and tab file
	zip -r -P $password  Kumpulan.zip ./$logfolder ./$folderkucing ./$folderkelinci -x *.sh* *.log* *.tab*
elif [ -e ./Kumpulan.zip ]
then
	echo "unzip and delete"
	unzip -P $password Kumpulan.zip 
	rm -rf "Kumpulan.zip"
fi

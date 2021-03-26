#!bin/bash

logdate=$(tail -1 Foto.log | awk '{print $1}' Foto.log )
yr=${date:1:5}
mo=${date:6:3}
dy=${date:10:2}
#printf "%s%s%s\n" $dy $mo $yr
logfolder="$dy$mo$yr"

folderkucing=$(kucing_*)
folderkelinci=$(kelinci_*)

password=$(date '+%m%d%Y')
echo $password
zip -r -P $password  Kumpulan.zip ./$logfolder ./$folderkucing ./$folderkelinci -x *.sh* *.log* *.tab*

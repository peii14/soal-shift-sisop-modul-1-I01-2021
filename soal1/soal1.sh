#!/bin/bash
perror=`grep -E -o 'ERROR.*' syslog.log | cut -f2- -d\ | cut -f1 -d"(" | sort | uniq -c | sort -n -r`
        #ngambil dari ERROR ke belakang | ngambil huruf| ngilangin uname| ngrutin yg udah di cut | ngitung kata ulang yg udah diurutin| ngurutin berdasarkan angka dari gede
        #                               | setelah error|   

echo "$perror"     
header="Error_Count";

echo "$perror" | while read error_check
do
    #output jumlah error per tipe error
    count=`echo $error_check | cut -d ' ' -f 1`
    #output tipe error
 	error_type=`echo $error_check | cut -d ' ' -f 2-`
	echo "$error_type,$count" 
done | sed '1 i\'$header > error_message.csv
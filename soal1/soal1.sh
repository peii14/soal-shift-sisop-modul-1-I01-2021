#!/bin/bash
error_counter=`grep -E -o 'ERROR.*' /home/damdum/syslog.log | cut -f2- -d\ | cut -f1 -d"(" | sort | uniq -c | sort -n -r`
        #ngambil dari ERROR ke belakang | ngambil huruf| ngilangin uname| ngrutin yg udah di cut | ngitung kata ulang yg udah diurutin| ngurutin berdasarkan angka dari gede
        #                               | setelah error ke belakang|   

#echo "$error_counter"

echo "$error_counter" | while read error_check
        do
                #output jumlah error per tipe error
                count=`echo $error_check | cut -f1 -d ' '`
                #echo "$count"
                #output tipe error
 	        error_type=`echo $error_check | cut -d ' ' -f2-`
	        echo "$error_type,$count" 
              #masukin header error_count di line pertama make sed
        done | sed '1i Error_Count' > error_message.csv
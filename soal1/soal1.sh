#!/bin/bash

grep -E -o '[E|I].*' syslog.log 

error_counter=`grep -E -o 'ERROR.*' syslog.log | cut -f2- -d\ | cut -f1 -d"(" | sort | uniq -c | sort -n -r`
        #ngambil dari ERROR ke belakang | ngambil huruf| ngilangin uname| ngrutin yg udah di cut | ngitung kata ulang yg udah diurutin| ngurutin berdasarkan angka dari gede
        #                               | setelah error ke belakang|

#echo "$error_counter"

user=`cut -d"(" -f2 syslog.log | cut -d")" -f1 | sort | uniq`
echo "$user" | while read uname
        do
                info=$(grep -E "INFO.*($uname))" syslog.log | wc -l) #wc -l ngitung number of line
                error=$(grep -E "ERROR.*($uname))" syslog.log | wc -l)
                echo "User : $uname, Info : $info,Error : $error"
        done

a="Error"
b="Count"
echo "$error_counter" | while read error_check
        do
                #output jumlah error per tipe error
                count=`echo $error_check | cut -f1 -d ' '`
                #echo "$count"
                #output tipe error
 	        error_type=`echo $error_check | cut -d ' ' -f2-`
	        echo "$error_type,$count" 
              #masukin header error_count di line pertama make sed
        done | sed '1i'$a,$b > error_message.csv

c="Username"
d="INFO"
f="ERROR"
echo "$user" | while read uname
        do
                info=$(grep -E "INFO.*($uname))" syslog.log | wc -l) 
                error=$(grep -E "ERROR.*($uname))" syslog.log | wc -l)
                echo "$uname, $info, $error"
        done | sed '1i'$c,$d,$f > user_statistic.csv;

# soal-shift-sisop-modul-1-I01-2021
1. Ryujin has just been accepted as an IT support at Bukapedia. He was given the task of making daily reports for the company's internal 		  application, ticky. There are 2 reports that he has to make, namely the report on the list of most error message ratings made by Ticky and user usage reports on the Ticky application. In order to make this report, Ryujin had to do the following:

(a) Collects information from application logs contained in the syslog.log file. The information required includes: log type (ERROR / INFO), log messages, and the username on each log line. Since Ryujin finds it difficult to check one line at a time manually, he uses regex to make his job easier. Help Ryujin create the regex.

	cat syslog.log | cut -f4- -d ":"

(b) Then, Ryujin must display all error messages that appear along with the number of occurrences.

	error_counter=`grep -E -o 'ERROR.*' /home/damdum/syslog.log | cut -f2- -d\ | cut -f1 -d"(" | sort | uniq -c | sort -n -r`							
	#ngambil dari ERROR ke belakang | ngambil huruf setelah error ke belakang| ngilangin uname| ngrutin yg udah di cut | ngitung kata ulang yg udah diurutin| ngurutin berdasarkan angka dari gede |    

		echo "$error_counter"

(c) Ryujin must also be able to display the number of occurrences of the ERROR and INFO logs for each user.
After all the necessary information has been prepared, now is the time for Ryujin to write all the information into a report in the csv file format.

(d) All information obtained in point b is written into the error_message.csv file with the Error, Count header, which is then followed by a list of error messages and the number of occurrences is ordered based on the number of occurrence of error messages from the most.

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

(e) All information obtained in point c is written into the user_statistic.csv file with the header Username, INFO, ERROR sorted by username in ascending order.

Note:

-AWK is not allowed

2. Steven and Manis founded a startup called ???TokoShiSop???, While you and Clemong are the first employees of TokoShiShop. After three years of work, Clemong was appointed to be TokoShiSop???s sales manager, while you became the head of the warehouse who supervised entry and exit of goods.

Every year, TokoShiSop holds a meeting that discusses how sales results and future strategies will be implemented. You???ve been very prepared for this year???s meeting. But suddenly, Steven, Manis, and Clemong ask you to look for some conclusions from the ???Laporan-TokoShiSop.tsv??? sales data.

(a) Steven wants to appreciate the performance of his employees so far by knowing Row ID and the largest profit percentage (if the largest profit percentage is more than 1, take the largest Row ID). To make your work easier, Clemong provides the definition of profit percentage, i.e.:

		Profit Percentage = (Profit Cost Price) 100
		Cost Price is obtained from the reduction of Sales with Profit. (Quantity ignored).

(b) Clemong has a promotional plan in Albuquerque using the MLM method. Therefore, Clemong needs a list of customer names on the 2017 transaction in Albuquerque.

(c) TokoShiSop focuses on three customer segments, among others: Home Offices, Customers, and Corporates. Clemong wants to increase sales in the customer segment that has the least sales. Therefore, Clemong needs a customer segment and the number of transactions with the least amount of transactions.

(d) TokoShiSop divides the sales region into four parts: Central, East, South, and West. Manis wants to find the region that has the least total profit and the total profit of that region.

(e) You are expected to be able to create a script that will produce a file ???Hasil.txt??? which has the following format:

		The last transaction with the largest *Transaction ID* with a percentage of *Profit Percentage*%.

		The list of customer names in Albuquerque in 2017 includes:
		*Customer Name1*
		*Customer Name2* etc

		The type of customer segment with the least sales is  *Segment Type* with *Total Transaction* transactions.

		The region which has the least total profit is *Region Name* with total profit *Total Profit*

to generate laporan ihir
```shell
	
#!/bin/bash

#A
awk -F"\t" '
#declare the comparison to find the max, use 0 because we need to find the max
BEGIN{{maxPP=0}}
#we need to avoid the first row because the first row its just a header
{if(NR>1){
	#find the biggest profit percentage (PP)
	#checking all profit percentage, and comparing it to find the biggest
	if($21/($18-$21)*100>=maxPP){
		#every time we get the current biggest, also take the id, so we can use it to print
		maxPP=$21/($18-$21)*100;
		maxID=$1;
	}
}	
}
END{
	#print the biggest profit percentage and the id
	printf("The last transaction with the largest %d with a percentage of %.d%%.\n\n",maxID,maxPP)
}
' /home/ascarya/Downloads/Laporan-TokoShiSop.tsv > /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt

#B
awk -F "\t" '
#to find the colloumn 2 that have 2017 and cloumn 10 that have Albuquerque
#and list the name of customer
$2~/2017/&&$10~/Albuquerque/ {listName[$7]++}
BEGIN{
	#print the header
	printf("The list of customer name in Albuqerque in 2017 includes:\n")
}
END{
	#loop for every listname 
	#print the name from the name list
	for(name in listName){
		printf("%s\n",name)
	}
	printf("\n")
}
' /home/ascarya/Downloads/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt


#C
awk -F "\t" '
#to find the column 8 with Corporate or Home Office or Consumer
#list segment, and if find corporate or home office or consumer counter it
$8~/Corporate/||$8~/Home Office/||$8~/Consumer/ {segmentList[$8]++}
END{
	segmentName;
	#using biggest value, because i want to find the minimal, so its easier to compare
	minTransaction=999999;
	#loop for every segmentlist
        for(transaction in segmentList){
		#comparing, to find the minimaltransaction
                if(minTransaction>segmentList[transaction]){
			#input the segmentname, so we can print it
                        segmentName=transaction;
			#input,the segment with the minimal transaction
                        minTransaction=segmentList[transaction];
                }
        }
	#print the segmentname and the transaction of the segment
	printf("The type of customer segment with the least sales is %s with %d transaction.\n\n",segmentName,minTransaction)
}
' /home/ascarya/Downloads/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt


#d
awk -F"\t" '
#If not the first row, then start to count the total profit for each region
{if(NR>1){
	#to find the total profit for every region, $21 is the profit 
	regionProfitList[$13]=regionProfitList[$13]+$21
}}
END{
	regionName;
	#using biggest value, so its easier to compare to find the minimal
	minProfit=999999;
	#loop for every region
	for(region in regionProfitList){
		#comparing the profit, if the least, than become minimal profit
		if(minProfit>regionProfitList[region]){
			#inputing the minimal profit from the region
			minProfit=regionProfitList[region];
			#input the reion name, so we can print it
			regionName=region;
	}
}
#print the region name and the profit
printf("The region wich has the least total profit is %s with total profit %d\n",regionName,minProfit)
}
' /home/ascarya/Downloads/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt
```
Thus these are the result of the report

	The last transaction with the largest 9952 with a percentage of 100.00%.

	The list of customer name in Albuqerque in 2017 includes:
	Benjamin Farhat
	Michelle Lonsdale
	Susan Vittorini
	David Wiener

	The type of customer segment with the least sales is Home Office with 1783 transaction.

	The region wich has the least total profit is Central with total profit 39706
Screenshot :

[![Screenshot-from-2021-04-04-20-24-32.png](https://i.postimg.cc/1tGTYc86/Screenshot-from-2021-04-04-20-24-32.png)](https://postimg.cc/dk04hCmt)

Problem :
- 2a, theres an eror divided by zero, because the loop read the first row (header). Solution, avoid the first row by if(NR>1)

Notes :

-Use bash, AWK, and supporting commands.

-The script at point (e) should be named  ???soal2_generate_laporan_ihir_shisop.sh???.

3. Kuuhaku is a person who really likes to collect digital photos, but Kuuhaku is also a lazy person so he doesn't want to bother looking for photos, besides that he is also shy, so he doesn't want anyone to see his collection, unfortunately, he has a friend named Steven who made being nosy his primary responsibility. Kuuhaku then had an idea, a way so that Steven won't be able to see his collection. To make his life easier, he is asking for your help. The idea is:

(a) Make a script to download 23 images from "https://loremflickr.com/320/240/kitten" and save the logs to the file "Foto.log". Since the downloaded images are random, it is possible that the same image is downloaded more than once, therefore you have to delete the same image (no need to download new images to replace them). Then save the images with the name "Kumpulan_XX" with consecutive numbers without missing any number (example: Koleksi_01, Koleksi_02, ...)

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
	
(b) Because Kuuhaku is too lazy to run the script manually, he also asks you to run the script once a day at 8 o'clock in the evening for some specific dates every month, namely starting the 1st every seven days (1,8, ...), as well as from the 2nd once every four days (2,6, ...). To tidy it up, the downloaded images and logs are moved to a folder named the download date with the format "DD-MM-YYYY" (example: "13-03-2023").

	#!bin/bash

	#directory naming
	#take date from log file by awk
	date=$(tail -1 Foto.log | awk '{print $1}' Foto.log )
	
	#take year start from 1 char add by 5 char from 1
	yr=${date:1:5}
	
	#take month start from 6 char add by 3 from 6
        mo=${date:6:3}
	
	#take day from 10 char add by 2 from 10
        dy=${date:10:2}

        #printf "%s%s%s\n" $dy $mo $yr
	#set directory name
	director="$dy$mo$yr"
	
	printf "%s\n" $director
	
	#initiate status of the folder
	status=false
	#if folder didnt exit create one and set status as true
	if [[ ! -d "$director" ]]
        then
                mkdir -p "$director"
		status=true
		fi
	#loop for total number of image
	for ((iter=1;iter<=23;iter=iter+1))
	do	
		#if the directory exist and status is strue move to the folder
		if [  "$status" = "true" ]&&[ -d "$director" ]
		then
			mv "Kumpulan_$iter.jpg" "$director/"
			#echo $status
		#when its false it means that the folder is already exist before
		else
			echo "SKIP PROCESS. ALREADY EXIST"
		fi
	done 
	
Crontab to run soal3b.sh

	0 20 1/7,2/4 * *  /bin/bash -c /soal3b.sh

(c) To prevent Kuuhaku getting bored with pictures of kittens, he also asked you to download rabbit images from "https://loremflickr.com/320/240/bunny". Kuuhaku asks you to download pictures of cats and rabbits alternately (the first one is free. example: 30th cat > 31st rabbit > 1st cat > ...). To distinguish between folders containing cat pictures and rabbit pictures, the folder names are prefixed with "Kucing_" or "Kelinci_" (example: "Kucing_13-03-2023").

	#!bin/bash
	#set todays date and take the day from the year count 
	today=$(date '+%d-%m-%y')
	day=$(date +"%--j")

	echo $today
	#if ther is no kucing folder for this day and the day is even
	if [ ! -d "kucing_$day" ]&&[ $(($day%2)) -eq 0 ]
	then 	
		#create the folder download kitten and move it to the directory that are made
		mkdir -p "kucing_$today"
		wget --output-document "$day.jpg" "https://loremflickr.com/320/240/kitten"
		mv "$day.jpg" "kucing_$today/"
	#when kelinci folder for this day is not reated and day is odd
	elif [ ! -d "kelinci_$day" ]&&[ $(($day%2)) -ne 0 ]
	then
		#create the folder download bunny and move it to kelinci this day folder
		mkdir -p "kelinci_$today"
		wget --output-document "$day.jpg" "https://loremflickr.com/320/240/bunny"
		mv "$day.jpg" "kelinci_$today/"
	fi



(d) To secure his Photo collection from Steven, Kuuhaku asked you to create a script that will move the entire folder to zip which is named "Koleksi.zip" and lock the zip with a password in the form of the current date with the format "MMDDYYYY" (example: "03032003").

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
		zip -rm -P $password  Kumpulan.zip ./$logfolder ./$folderkucing ./$folderkelinci -x *.sh* *.log* *.tab*
	elif [ -e ./Kumpulan.zip ]
	then
		echo "unzip and delete"
		unzip -P $password Kumpulan.zip 
		rm -rf "Kumpulan.zip"
	fi


(e) Because kuuhaku only met Steven during college, which is every day except Saturday and Sunday, from 7 am to 6 pm, he asks you to zip the collection during college, apart from the time mentioned, he wants the collection unzipped. and no other zip files exist.

	0 7,18 * * 1-5  /bin/bash -c /soal3d.sh

Note:

-Use bash, AWK, and other commands

-Write all the cron used in file cron3[b/e].tab respectively

From number 3 we got problem of running the crontab, and also in 3a about the re-updating file log, yet it doesnt change the final state that the case wanted, because the algorithm already stores all of the original file name to compare to the latest download for taking action either delete the latest photo or continue to the next download sequence.



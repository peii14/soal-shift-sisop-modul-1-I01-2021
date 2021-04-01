#!/bin/bash

#A
awk -F"\t" '
{if(NR>1){
	#find the biggest profit percentage (PP)
	#checking all profit percentage, and comparing it to find the biggest
	maxPP=0;
	if(($21/($18-$21))*100>maxPP){
		#every time we get the current biggest, also take the id, so we can use it to print
		maxPP=($21/($18-$21))*100;maxID=$1
	}
}}
END{
	#print the biggest profit percentage and the id
	printf("The last transaction with the largest %d with a percentage of %.2f%.\n\n",maxID,maxPP)
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

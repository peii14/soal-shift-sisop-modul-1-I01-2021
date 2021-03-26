#!/bin/bash

#A
awk -F"\t" '
BEGIN{maxPP=0}
	{
	if((($21/(($18-$21)+0.000001))*100)>maxPP){
		maxPP=(($21/(($18-$21)+0.000001))*100);maxID=$1
	}
}
END{
	printf("The last transaction with the largest %d with a percentage of %.2f%%.\n\n",maxID,maxPP)
}
' /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/Laporan-TokoShiSop.tsv > /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt

#B
awk -F "\t" '
$2~/2017/&&$10~/Albuquerque/ {list[$7]++}
BEGIN{
	printf("The list of customer name in Albuqerque in 2017 includes:\n")
}
END{
	for(name in list){
		printf("%s\n",name)
	}
	printf("\n")
}
' /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt


#C
awk -F "\t" '
$8~/Corporate/||$8~/Home Office/||$8~/Consumer/ {segmentList[$8]++}
END{
	segmentName;
	minTransaction=999999;
        for(transaction in segmentList){
                if(minTransaction>segmentList[transaction]){
                        segmentName=transaction;
                        minTransaction=segmentList[transaction];
                }
        }
	printf("The type of customer segment with the least sales is %s with %d transaction.\n\n",segmentName,minTransaction)
}
' /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt


#d
awk -F"\t" '
{if(NR>1){
	regionProfitList[$13]=regionProfitList[$13]+$21
}}
END{
	regionName;
	minProfit=999999;
	for(region in regionProfitList){
		if(minProfit>regionProfitList[region]){
			minProfit=regionProfitList[region];
			regionName=region;
	}
}
printf("The region wich has the least total profit is %s with total profit %d\n",regionName,minProfit)
}
' /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/Laporan-TokoShiSop.tsv >> /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt

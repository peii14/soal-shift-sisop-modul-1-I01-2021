#!/bin/bash

#A
awk -F"\t" '
BEGIN{maxPP=0}{
	if((($21/(($18-$21)+0.000001))*100)>maxPP){
		maxPP=(($21/(($18-$21)+0.000001))*100);maxID=$1
	}
}
END{
	printf("The last transaction with the largest %d with a percentage of %.2f%%.\n",maxID,maxPP)
}
' /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/Laporan-TokoShiSop.tsv > /home/ascarya/sisop/soal-shift-sisop-modul-1-I01-2021/soal2/hasil.txt
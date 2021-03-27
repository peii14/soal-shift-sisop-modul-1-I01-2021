# soal-shift-sisop-modul-1-I01-2021
1. Ryujin has just been accepted as an IT support at Bukapedia. He was given the task of making daily reports for the company's internal 		  application, ticky. There are 2 reports that he has to make, namely the report on the list of most error message ratings made by Ticky and user usage reports on the Ticky application. In order to make this report, Ryujin had to do the following:

(a) Collects information from application logs contained in the syslog.log file. The information required includes: log type (ERROR / INFO), log messages, and the username on each log line. Since Ryujin finds it difficult to check one line at a time manually, he uses regex to make his job easier. Help Ryujin create the regex.

(b) Then, Ryujin must display all error messages that appear along with the number of occurrences.

(c) Ryujin must also be able to display the number of occurrences of the ERROR and INFO logs for each user.
After all the necessary information has been prepared, now is the time for Ryujin to write all the information into a report in the csv file format.

(d) All information obtained in point b is written into the error_message.csv file with the Error, Count header, which is then followed by a list of error messages and the number of occurrences is ordered based on the number of occurrence of error messages from the most.

(e) All information obtained in point c is written into the user_statistic.csv file with the header Username, INFO, ERROR sorted by username in ascending order.

Note:

-AWK is not allowed

2. Steven and Manis founded a startup called “TokoShiSop”, While you and Clemong are the first employees of TokoShiShop. After three years of work, Clemong was appointed to be TokoShiSop’s sales manager, while you became the head of the warehouse who supervised entry and exit of goods.

Every year, TokoShiSop holds a meeting that discusses how sales results and future strategies will be implemented. You’ve been very prepared for this year’s meeting. But suddenly, Steven, Manis, and Clemong ask you to look for some conclusions from the “Laporan-TokoShiSop.tsv” sales data.

(a) Steven wants to appreciate the performance of his employees so far by knowing Row ID and the largest profit percentage (if the largest profit percentage is more than 1, take the largest Row ID). To make your work easier, Clemong provides the definition of profit percentage, i.e.:

		Profit Percentage = (Profit Cost Price) 100
		Cost Price is obtained from the reduction of Sales with Profit. (Quantity ignored).

(b) Clemong has a promotional plan in Albuquerque using the MLM method. Therefore, Clemong needs a list of customer names on the 2017 transaction in Albuquerque.

(c) TokoShiSop focuses on three customer segments, among others: Home Offices, Customers, and Corporates. Clemong wants to increase sales in the customer segment that has the least sales. Therefore, Clemong needs a customer segment and the number of transactions with the least amount of transactions.

(d) TokoShiSop divides the sales region into four parts: Central, East, South, and West. Manis wants to find the region that has the least total profit and the total profit of that region.

(e) You are expected to be able to create a script that will produce a file “Hasil.txt” which has the following format:

		The last transaction with the largest *Transaction ID* with a percentage of *Profit Percentage*%.

		The list of customer names in Albuquerque in 2017 includes:
		*Customer Name1*
		*Customer Name2* etc

		The type of customer segment with the least sales is  *Segment Type* with *Total Transaction* transactions.

		The region which has the least total profit is *Region Name* with total profit *Total Profit*


Notes :

-Use bash, AWK, and supporting commands.

-The script at point (e) should be named  ‘soal2_generate_laporan_ihir_shisop.sh’.

3. Kuuhaku is a person who really likes to collect digital photos, but Kuuhaku is also a lazy person so he doesn't want to bother looking for photos, besides that he is also shy, so he doesn't want anyone to see his collection, unfortunately, he has a friend named Steven who made being nosy his primary responsibility. Kuuhaku then had an idea, a way so that Steven won't be able to see his collection. To make his life easier, he is asking for your help. The idea is:

(a) Make a script to download 23 images from "https://loremflickr.com/320/240/kitten" and save the logs to the file "Foto.log". Since the downloaded images are random, it is possible that the same image is downloaded more than once, therefore you have to delete the same image (no need to download new images to replace them). Then save the images with the name "Kumpulan_XX" with consecutive numbers without missing any number (example: Koleksi_01, Koleksi_02, ...)

(b) Because Kuuhaku is too lazy to run the script manually, he also asks you to run the script once a day at 8 o'clock in the evening for some specific dates every month, namely starting the 1st every seven days (1,8, ...), as well as from the 2nd once every four days (2,6, ...). To tidy it up, the downloaded images and logs are moved to a folder named the download date with the format "DD-MM-YYYY" (example: "13-03-2023").

(c) To prevent Kuuhaku getting bored with pictures of kittens, he also asked you to download rabbit images from "https://loremflickr.com/320/240/bunny". Kuuhaku asks you to download pictures of cats and rabbits alternately (the first one is free. example: 30th cat > 31st rabbit > 1st cat > ...). To distinguish between folders containing cat pictures and rabbit pictures, the folder names are prefixed with "Kucing_" or "Kelinci_" (example: "Kucing_13-03-2023").

(d) To secure his Photo collection from Steven, Kuuhaku asked you to create a script that will move the entire folder to zip which is named "Koleksi.zip" and lock the zip with a password in the form of the current date with the format "MMDDYYYY" (example: "03032003").

(e) Because kuuhaku only met Steven during college, which is every day except Saturday and Sunday, from 7 am to 6 pm, he asks you to zip the collection during college, apart from the time mentioned, he wants the collection unzipped. and no other zip files exist.

Note:

-Use bash, AWK, and other commands

-Write all the cron used in file cron3[b/e].tab respectively



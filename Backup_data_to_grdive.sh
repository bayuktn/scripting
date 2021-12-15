sudo apt install p7zip-full

#create a 7z file
7z a test.7z nama_file

#extract a 7z file
7z e test.7z

#see 7z file
7z l test.7z

#download github file release gdrive
wget https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_amd64.tar.gz

1. upload ke gdrive dengan format db-13-12-2021.7z 
2. setelah itu list db dan hapus di bagian list paling awal.


Size :
Image 2 = 9.1G $HOME/images/pbc
Image 1 = 6.5G $HOME/image/pbc
Data Strack = 582M /var/lib/docker/volumes/warna_sales_WarnaFiles/_data
DB Simotor = 297M 
DB Strack = 831M 
Total = 17,5 GB 

gdrive sync  upload /home/abay/backup_drive 107_0GlH6vrufgOJctd1xHu5XI-cIkFta
gdrive sync content 107_0GlH6vrufgOJctd1xHu5XI-cIkFta
gdrive delete 1YDR7tb5oxtYoyk1rv8xqktNWfcvGfvM4
read satu <<< $(gdrive sync content 107_0GlH6vrufgOJctd1xHu5XI-cIkFta | awk 'FNR==2{print $1}')
ls -lah | awk 'FNR==4{print $9}'

backup_strack_data = berguna untuk conversi data ke 7z
upload_drive = berguna untuk upload data ke drive.
delete_drive = berguna untuk menghapus satu data yang paling atas.

##Upload data to google drive and delete data on disk
#!/bin/bash
dir_data=/var/lib/docker/volumes/warna_sales_WarnaFiles/
read tgl <<< $(date +"%d-%m-%Y")
cd $dir_data

7z a $HOME/backup_store/data_strack-$tgl.7z _data

gdrive sync  upload /root/backup_store 1jNw5GTV9xOUHMYngcdO5ttJ1WBtlpqxo
rm $HOME/backup_store/*

##Delete data to google drive
#!/bin/bash
read data_drive <<< $(gdrive sync content  1jNw5GTV9xOUHMYngcdO5ttJ1WBtlpqxo| awk 'FNR==2{print $1}')
gdrive delete $data_drive

#Cron section
0  1    * * 6   root    backup_data.sh
0  1   15,24 * *        root    delete_drive.sh

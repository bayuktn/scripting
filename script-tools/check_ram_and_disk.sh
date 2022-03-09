RAM

TOTAL = free -mh | awk 'FNR==2{print $2}' 
TERPAKAI = free -mh | awk 'FNR==2{print $3}' 
SISA = free -mh | awk 'FNR==2{print $4}' 

HDD

TOTAL = df -h | awk 'FNR==4{print $2}'
TERPAKAI = df -h | awk 'FNR==4{print $3}'
SISA = df -h | awk 'FNR==4{print $4}

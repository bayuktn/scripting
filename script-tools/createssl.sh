#!/bin/bash
certbot --redirect -n -q --nginx -d $1 > /dev/null 2>&1
if [[ -z $1 ]]
then 
	echo 'Masukkan "createssl.sh namadomain"'
fi

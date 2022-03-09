#!/bin/bash
#Input Section
read -p "Write Domain name [ domain.id] > " dom
read -p "Port Number [8080] > " po
read -p "Write IP of Services [100.23.42.12] > " ip
#Variable Section
si_ava='/etc/nginx/sites-available'
si_ena='/etc/nginx/sites-enabled'
htup='$host'
host='$http_upgrade'



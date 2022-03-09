#!/bin/bash
#Detect nginx & certbot Section
dpkg -l | grep nginx > /dev/null
if [[ $? != 0 ]]
then apt update && apt install nginx
fi
dpkg -l | grep certbot > /dev/null
if [[ $? != 0 ]]
then apt update && apt install cerbot && apt install python3-cerbot-nginx
fi
#Input Section
cip=$(hostname -I | awk '{print $1}')
echo '<------------------------------------->'
echo 'This Script credit by IG : @bayuktn'
echo ' YOUR SERVER IP IS' $cip
read -n 1 -r -s -p $'[WARNING !!!]\n Please Read This Caution !!\n Configure your DOMAIN FIRST revers to IP address on this Server Before you continue this step...\n Press enter to continue...\n'
read -p "Write Domain name [ domain.id] > " dom
read -p "Port Number [8080] > " po
read -p "Write IP of Services [100.23.42.12] > " ip
read -p "Write Email for SSL Notif [ex@gmail.com] > " mail 
#Variable Section
si_ava='/etc/nginx/sites-available'
si_ena='/etc/nginx/sites-enabled'
htup='$host'
host='$http_upgrade'
reqm='$request_method'
#Script Section
cat > $si_ava/$dom << EOF
server {
    root /var/www/my-example-domain.com/current/public; # Directly serves anything in the Rails public folder
    index index.html index.htm index.nginx-debian.html;
    server_name $dom ; # managed by Certbot

    location / {
        proxy_pass http://$ip:$po; # 8030 is the port the Docker container is running on
          proxy_set_header Host $htup;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $host;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $host;
        proxy_buffering off;
        proxy_read_timeout 1800;
        proxy_hide_header 'access-control-allow-origin';
        add_header 'access-control-allow-origin' '*' always;
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-Chisel-Proxied-Url,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range,x-api,*';
        add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';
        if ($reqm = 'OPTIONS') {
          add_header 'Access-Control-Allow-Origin' '*' always;
          add_header 'Access-Control-Allow-Credentials' 'true';
          add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-Chisel-Proxied-Url,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range,x-api,*';
          add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';
          add_header 'Access-Control-Max-Age' 1728000;
          add_header 'Content-Type' 'text/plain charset=UTF-8';
          add_header 'Content-Length' 0;
          return 204;
       		 }
	}
}
EOF
ln -s $si_ava/$dom $si_ena/
nginx -t > .new_log.log
if [[ $? != 0  ]]
then 
	echo "Something Wrong Please Check on new_log.log"
else
	systemctl restart nginx
	certbot  --agree-tos -m $mail  --no-eff-email --redirect -n -q --nginx -d $dom
fi
echo 'Congrats you complete to make a VirtualHost revers to this Server'
echo 'Please check your domain on url '$dom 

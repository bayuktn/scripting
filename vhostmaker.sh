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
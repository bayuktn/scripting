#!/bin/bash
#Baris input
read -p 'Domain name : ' dom
read -p 'Port name : ' port
read -p 'Input IP Address : ' ip
#Baris Ket Variable
site_avail='/etc/nginx/sites-available'
site_ena='/etc/nginx/sites-enabled'
htup='$http_upgrade'
host='$host'
remot='$remote_addr'
ur='$uri'
requri='$request_uri'
#Baris Script
cat > $site_avail/$dom << EOF
server {
    root /var/www/my-example-domain.com/current/public; # Directly serves anything in the Rails public folder
    index index.html index.htm index.nginx-debian.html;
    server_name  $dom;

    location / {
        proxy_pass http://$ip:$port;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $htup;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $htup;
        proxy_buffering off;
        proxy_set_header X-Real-IP $remot;
          #try_files $ur $ur/ =404;
    }

    #listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/$dom/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/$dom/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {

    if ($host =  $dom) {
        return 301 https://$host$requri;
    } # managed by Certbot

    listen 80 ;
    listen [::]:80 ;
    server_name $dom;
    return 404; # managed by Certb;
 }
EOF
#Baris membuat Shortcut
sudo ln -s $site_avail/$dom $site_ena/$dom
#Baris Restart Service
echo 'Wish you to restart Nginx Service ?'
select rst in 'Y' 'N'; do
        case $rst in
                Y ) systemctl restart nginx; break;;
                N ) exit;;
        esac
done
#Baris React
echo 'Selamat Anda Sudah membuat Config dengan domain $dom'
                                                                                                        65,1          Bot

#!/bin/bash
read -p 'Insert Domain Name = ' cc
sudo certbot --nginx -d $cc
echo 'Creating Certificate Success'

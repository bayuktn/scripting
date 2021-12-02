#!/bin/bash
sudo forever list
read -p 'Pilih process UID yang akan dihentikan [Default is 0]= '  uid
sudo forever stop $uid
read -p 'Masukkan Port yang akan di hentikan [Ex : 8080]= ' port
sudo kill -9 $(sudo lsof -t -i:$port) >> /dev/null
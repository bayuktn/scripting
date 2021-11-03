#!/bin/bash
sana=$HOME/simotor
cd $sana/bid/
screen   -dmS bid_service bash -c './bid'
cd $sana/helper/
screen   -dmS helper_service bash -c  './helpers'
cd $sana/iklan/
screen   -dmS iklan_service  bash -c './iklan'
cd $sana/log/
screen   -dmS log_service  bash -c './log'
cd $sana/master/
screen   -dmS master_service bash -c  './master'
cd $sana/produk/
screen   -dmS produk_service  bash -c './produk_v111'
cd $sana/report/
screen   -dmS report_service  bash -c './report'
cd $sana/setup/
screen   -dmS setup_service  bash -c './setup'
cd $sana/tiket/
screen   -dmS tiket_service  bash -c './tiket_v111'
cd $sana/transaksi/
screen   -dmS transaksi_service bash -c  './transaksi'
cd $sana/user/
screen   -dmS user_service  - './user'

sudo screen -ls 
echo 'Selamat anda telah menjalankan semua service !'

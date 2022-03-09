#!/bin/bash
tm=$(timedatectl status | awk 'FNR==4{print $3}' | cut -b 6-)
zone=Jakarta
if [[ $tm != $zone ]]
then
     timedatectl set-timezone Asia/Jakarta
     timedatectl status |  awk 'FNR==4{print $3}'
fi

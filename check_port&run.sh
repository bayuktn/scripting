#!/bin/bash
while :
do
        lsof -i:25
        if [[ "$?" == 1 ]];
        then
                systemctl restart postfix
        fi
done

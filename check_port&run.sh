#!/bin/bash
while :
do
        lsof -i:25
        if [[ "$?" == 1 ]];
        then
                systemctl restart postfix
        fi
done

##!/bin/bash
#while :
#do
#        sudo lsof -i:8809
#        if [[ "$?" == 1 ]];
#        then
#              cd /home/backend/simotor/log
#              sudo screen -dmS Rerun_Log_service bash -c './log'
#        fi
#done

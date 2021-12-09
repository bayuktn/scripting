#Check run port & and running 

#!/bin/bash
while :
do
        sudo lsof -i:8809
        if [[ "$?" == 1 ]];
        the
              cd /home/backend/simotor/log
              sudo screen -dmS Rerun_Log_service bash -c './log'
        fi
done

#Run service log
cd /home/backend/simotor/log
sudo screen -dmS Rerun_Log_service bash -c './log'

#Stop Service Port 
sudo screen -S Rerun_Log_service -X quit

#Melihat Service Screen
sudo screen -S Rerun_Log_service -r

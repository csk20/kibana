#!/bin/sh
set -e
count ='ps -ef | grep health | grep bin | wc -l | awk 'print$1''

if[$count -eq 0]; then
   echo -n "starting kibana.."
# /home/sofftwar/kibana/logs/kibana.log   --cluster.name =clusterNode
   CONSOLE_LOG_FILE=path to log foldrt/kibana.log 
   nohup ./health.sh >$CONSOLE_LOG_FILE 2>&1 &
   isStarted= 'tail -n 500 $CONSOLE_LOF_FILE | grep -i Started | wc -l'
   until [$isStarted -eq 1]
   do
		isStarted= 'tail -n 500 $CONSOLE_LOF_FILE | grep -i Started | wc -l'
		echo -n "."
		sleep 1
   done
   echo -e  "\n kibanaq started"
   exit 0
else
   echo "kibana is running"
   exit 1
fi  
#!/bin/sh
set -e
#health check first
count ='ps -ef | grep $USER |grep health|grep bin| wc -l | awk 'print$1''
if[$count -eq 0]; then
   echo -n "kiba health is not running"
else  
   echo "kibana health is running"
fi 

#kibana check
count ='lsof -i:5601  | wc -l | awk 'print$1''
if[$count -eq 0]; then
   echo -n "kibana is not running"
else  
   echo "kiban  is not running"
fi 
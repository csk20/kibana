#!/bin/sh
set -e




count ='ps -ef | grep $USER |grep health| grep bin| wc -l | awk 'print$1''
if[$count -eq 0]; then
   echo -n "health is not running"
else  
   ps -ef | grep $USER |grep health |  awk 'print$2' | xargs - kill {}
   echo "health  stoped"
fi   


#kibana stop 
count ='lsof -i:5601 | grep $USER  | wc -l | awk 'print$1''
if[$count -eq 0]; then
   echo -n "es is not running"
else  
  #kibana is running at port 5601
   lsof -i:5601 | grep $USER | awk 'print$2' | xargs - kill {}
   echo "es stoped"
fi   
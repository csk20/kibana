#!/bin/sh
set -e
count=0;
CMD=./kibana

until $CMD && false; do
	echo "$CMD stopped $count times restarting in 10 second..">&2
	sleep 10
	count= $(($count+1))
	if [$count -eq 5]; then
		echo "$CMD  stopped $ count times. It wi;ll not be restarted">&2
		exit 1
	fi
done	
	
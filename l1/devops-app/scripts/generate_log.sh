#!/bin/bash

LOG_FILE="../logs/app.log"

IPS=("192.168.1.10" "192.168.1.11" "192.168.1.12" "10.0.0.5" "10.0.0.6")

for i in {1..1000}
do
    IP=${IPS[$RANDOM % ${#IPS[@]}]}
    
    STATUS=$((RANDOM % 3))

    if [ $STATUS -eq 0 ]; then
        LEVEL="INFO"
        CODE=200
    elif [ $STATUS -eq 1 ]; then
        LEVEL="WARN"
        CODE=404
    else
        LEVEL="ERROR"
        CODE=500
    fi

    echo "$(date '+%Y-%m-%d %H:%M:%S') $LEVEL $IP GET /api/resource $CODE" >> "$LOG_FILE"
done

echo "Log file generated at $LOG_FILE"

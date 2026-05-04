#!/bin/bash


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/logs/basic.log"
NUMBER=0

mkdir -p "${SCRIPT_DIR}/logs"


trap 'echo "[ $(date +"%T") ] Process was completed correctly" >> $LOG_FILE && exit 0' SIGTERM 
trap '((NUMBER=0)); echo "[ $(date +"%T") ] Process was restarted" >> $LOG_FILE' SIGHUP
trap 'echo "[ $(date +"%T") ] This process has been touched" >> $LOG_FILE' SIGUSR1

while true
do
echo "[ $(date +'%T') ] Log $NUMBER">> $LOG_FILE
sleep 1
((NUMBER+=1))
done



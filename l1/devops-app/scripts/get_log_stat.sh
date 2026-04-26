#!/bin/bash
set -u
set -e


LOG_FILE=../logs/app.log
STAT_FILE=../logs/stat.log
ARCHIVE_DIR=../archive
TIME=$(date +"%F_%T")
echo "ERRORS number: $(grep -w "ERROR" $LOG_FILE | wc -l)" > $STAT_FILE

echo -e "Top IP:\n$( grep -w "ERROR" $LOG_FILE |awk '{print $4}' | sort | uniq -c | sort -rn)" >> $STAT_FILE

tar -C ../logs -czf "${ARCHIVE_DIR}"/arch_"${TIME}".tar.gz stat.log

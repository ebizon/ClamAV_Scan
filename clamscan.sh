#!/bin/bash
 
day=$(date +%F)

# Update clamav with latest definitions
freshclam

# Scan the drupal root directory and keep the logs in a file
/usr/bin/clamscan -r /var/www/ > /mnt/clamav-logs/clamav-log_$day

# email subject
SUBJECT="VIRUS DETECTED ON `hostname`!!!"
# Email To ?
EMAIL="YOURNAME@EMAIL.COM,YOURNAME2@EMAIL.COM"
# Log location
LOG=/mnt/clamav-logs/clamav-log_$day
 
check_scan () {
# 
    # Check the last set of results. If there are any "Infected" counts that aren't zero, we have a problem.
    if [ `cat ${LOG} | grep Infected | grep -v 0 | wc -l` != 0 ]
    then
	echo "Importance: High, A Virus Found" | mail -s $SUBJECT $EMAIL
    fi
       
    if [ `cat ${LOG} | grep Infected | grep -v 0 | wc -l` = 0 ]
    then
        echo "Scan complted, no VIRUS Found" | mail -s $SUBJECT $EMAIL
    fi

}

check_scan





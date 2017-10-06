ClamAV_Scan
===========

Its a script to run clamav on linux machine, as per the desired schedule by configuring the script at cron job. It minimises the server load while running clamav in daemon mode. 

It requires clamav to be installed on server.

It basically sends an email to mentioned email id if a virus is found.

Please replace <i>YOURNAME@EMAIL.COM</i> in `clamscan.sh` with the email id to which you want to send emails.<br>
You may also use multiple email ids separated by commas.

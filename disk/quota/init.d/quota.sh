#!/bin/sh
# /etc/init.d/quota.sh
# SGL-script-version=20030410
# this sets the run levels and priority for links
# SGL-START:S:S11
# SGL-STOP:0 6:K89

source /etc/init.d/functions

start() {

  # Check quota and then turn quota on. 
  if [ -x /usr/sbin/quotacheck ] 
        then 
               echo "Checking quotas. This may take some time." 
               /usr/sbin/quotacheck -avug 
               evaluate_retval

        fi 
         if [ -x /usr/sbin/quotaon ] 
        then 
                echo "Turning on quota..." 
                /usr/sbin/quotaon -avug 
                evaluate_retval
        fi

}


stop() {

         if [ -x /usr/sbin/quotaoff ] 
        then 
                echo "Turning off quota..." 
                /usr/sbin/quotaoff -avug 
                evaluate_retval
        fi

}


case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac

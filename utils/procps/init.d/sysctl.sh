#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:S:S99
# SMGL-STOP:6:K50
#

if  [  -f  /etc/sysctl.conf  ];  then  sysctl  -p;  fi

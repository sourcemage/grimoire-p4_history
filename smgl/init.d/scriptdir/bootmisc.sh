#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:S:S99

dmesg  >  /var/log/dmesg
touch     /var/run/utmp
loadkeys  us-latin1
export  LANG="en_US"
mkdir /tmp/.ICE-unix
chmod 1777 /tmp/.ICE-unix

#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:0 6:K80
#

echo  -n "Sending all processes the TERM signal... "
killall5  -15
echo     "done."

sleep 5

echo  -n "Sending all processes the KILL signal... "
killall5  -9
echo     "done."

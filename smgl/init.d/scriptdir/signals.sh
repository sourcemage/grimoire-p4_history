#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-STOP:0 6:K80

source /etc/init.d/functions

echo  "Sending all processes the TERM signal... "
killall5  -15
evaluate_retval

sleep 5

echo  "Sending all processes the KILL signal... "
killall5  -9
evaluate_retval

#!/bin/sh
source /etc/init.d/functions

echo  "Sending all processes the TERM signal... "
killall5  -15
evaluate_retval

sleep 5

echo  "Sending all processes the KILL signal... "
killall5  -9
evaluate_retval

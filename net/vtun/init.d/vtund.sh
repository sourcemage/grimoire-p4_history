#!/bin/sh
#
# SMGL-script-version=20030530
# SMGL-START:1 2 3 4 5:S34
# SMGL-STOP:0 6:K60

# vtund won't start until you change this value to YES.
# Please make sure you've configured /etc/vtund.conf, then
# change this value.
CONFIGURED=NO

. /etc/init.d/functions

unconfigured()
{
  cat <<EOF
##############################################################
WARNING    WARNING    WARNING    WARNING    WARNING    WARNING

Vtund has not been configured yet, and will not be started
at boot for fear of opening a security hole.

Please check /etc/vtund.conf, and once you're happy with
the config, change CONFIGURED=NO to CONFIGURED=YES in
/etc/init.d/vtund

##############################################################
EOF

  exit 1
}

case $1 in

  start)    echo "$1ing vtund."
            if [ "$CONFIGURED" != "YES" ]; then
              unconfigured
            fi
            loadproc vtund -s
            ;;

  restart)  echo "$1ing vtund."
            if [ "$CONFIGURED" != "YES" ]; then
              unconfigured
            fi
            reloadproc vtund
            ;;

  stop)     echo "$1ping vtund."
            killproc vtund
            ;;

  *)        echo "Usage: $0 {start|stop|restart}"
            exit 1
            ;;
esac

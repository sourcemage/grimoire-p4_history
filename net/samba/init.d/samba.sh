#!/bin/sh
#
# /etc/init.d/samba.sh
#
# SMGL-script-version=20030404
# SMGL-START:3 4 5:S50
# SMGL-STOP:0 1 2 6:K50
#
# Written by, Jeremy Sutherland
# Patched by, Robert Helgesson
#
# samba init.d script for shared startup with inetd/xinetd
#
source /etc/init.d/functions
#
start_samba()
{
  if [ ! -e /var/run/samba ]; then
    mkdir /var/run/samba
  fi
  if ! netstat -l --udp | grep -q netbios-ns ; then
    echo "NetBIOS nameserver"
    loadproc /usr/sbin/nmbd
  fi
  if ! netstat -l --tcp | grep -q netbios-ssn ; then
    echo "NetBIOS sessions"
    loadproc /usr/sbin/smbd
  fi
}
#
stop_samba()
{
  if netstat -l --udp | grep -q netbios-ns ; then
    if [ ! -e /etc/xinetd.d/netbios-ns ]; then
      echo "NetBIOS nameserver"
      killproc /usr/sbin/nmbd
    fi
  fi
  if netstat -l --tcp | grep -q netbios-ssn ; then
    if [ ! -e /etc/xinetd.d/netbios-ssn ]; then
      echo "NetBIOS sessions"
      killproc /usr/sbin/smbd
    fi
  fi
}
#
status_samba()
{
  if [ netstat -l --udp | grep -q netbios-ns ]; then
    if [ -e /etc/xinetd.d/netbios-ns ]; then
      echo "NetBIOS nameserver : xinetd"
      evaluate_retval
    fi
    if [ ! -e /etc/xinetd.d/netbios-ns ]; then
      echo "NetBIOS nameserver : daemon"
      evaluate_retval
    fi
  fi
  if [ netstat -l --udp | grep -q netbios-ssn ]; then
    if [ -e /etc/xinetd.d/netbios-ssn ]; then
      echo "NetBIOS sessions : xinetd"
      evaluate_retval
    fi
    if [ ! -e /etc/xinetd.d/netbios-ssn ]; then
      echo "NetBIOS sessions : daemon"
      evaluate_retval
    fi
  fi
}
#
case $1 in

  start)   echo "Starting Samba Services"
           start_samba
	   ;;

  stop)    echo "Stopping Samba Services"
           stop_samba
	   ;;

  restart) echo "Restarting Samba Services"
           stop_samba
           start_samba
           ;;

  status)  echo "Status of Samba Services"
           status_samba
	   ;;

  *)       echo "Usage $0 {start|stop|restart|status}"
           ;;

esac
#

#!/bin/bash
#
# alsasound     This shell script takes care of starting and stopping
#               the ALSA sound driver.
#
# This script requires /usr/sbin/alsactl and /usr/bin/aconnect programs
# from the alsa-utils package.
#
# Copyright (c) by Jaroslav Kysela <perex@suse.cz> 
#
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
#
# chkconfig: 2345 87 14
# description: ALSA driver
#
# further improvements by Bernd Kaindl, Olaf Hering and Takashi Iwai.
# modified for SourceMage GNU Linux

source /etc/init.d/functions

alsactl=/usr/sbin/alsactl
asoundcfg=/etc/asound.state
aconnect=/usr/bin/aconnect
alsascrdir=/etc/alsa.d

function start() {
  #
  # insert all sound modules
  #

  drivers=`/sbin/modprobe -c | \
    grep -E "^[[:space:]]*alias[[:space:]]+snd-card-[[:digit:]]" | \
    awk '{print $3}'`
  for i in $drivers; do
    if [ "$i" != off ]; then
      echo -n "Starting sound driver: $i "
      /sbin/modprobe $i
      evaluate_retval
    fi
  done
  #
  # insert sequencer modules
  #
  if [ x"$START_ALSA_SEQ" = xyes -a -r /proc/asound/seq/drivers ]; then
    t=`cut -d , -f 1 /proc/asound/seq/drivers`
    if [ "x$t" != "x" ]; then
	echo -n "Starting sequencer modules: $t "
      /sbin/modprobe $t
      evaluate_retval
    fi
  fi
  #
  # restore driver settings
  #
  if [ -d /proc/asound ]; then
    if [ ! -r $asoundcfg ]; then
      echo "No mixer config in $asoundcfg, you have to unmute your card!"
    else
      if [ -x $alsactl ]; then
        $alsactl -f $asoundcfg restore
      else
        echo -e "$WARNING ERROR: alsactl not found $NORMAL"
      fi
    fi
  fi
  #
  # run card-dependent scripts
  for i in $drivers; do
    t=${i##snd-}
    if [ -x $alsascrdir/$t ]; then
      $alsascrdir/$t
    fi
  done
}

function terminate() {
  #
  # Kill processes holding open sound devices
  #
  # DEVS=`find /dev/ -follow -type c -maxdepth 1 -print 2>/dev/null | xargs ls -dils | grep "1*1[46]," | cut -d: -f2 | cut -d" " -f2; echo /proc/asound/dev/*`
  ossdevs="/dev/admmidi? /dev/adsp? /dev/amidi? /dev/audio* /dev/dmfm* /dev/dmmidi? /dev/dsp* /dev/dspW* /dev/midi0? /dev/mixer? /dev/music /dev/patmgr? /dev/sequencer* /dev/sndstat"
  alsadevs="/proc/asound/dev/*"
  fuser -k $ossdevs $alsadevs 2> /dev/null 1>/dev/null
  #
  # remove all sequencer connections if any
  #
  if [ -f /proc/asound/seq/clients -a -x $aconnect ]; then
    $aconnect --removeall

  fi
}

function stop() {
  #
  # store driver settings
  #
  if [ -x $alsactl ]; then
    $alsactl -f $asoundcfg store
  else
    echo -n -e "$WARNING !!!alsactl not found!!! $NORMAL "
  fi
  #
  # remove all sound modules
  #
  echo "Shutting down sound driver."
  /sbin/lsmod | grep -E "^snd" | grep -v "snd-hammerfall-mem" | while read line; do \
     /sbin/rmmod `echo $line | cut -d ' ' -f 1`; \
      evaluate_retval
  done
  # remove the 2.2 soundcore module (if possible)
  /sbin/rmmod soundcore 2> /dev/null
  /sbin/rmmod gameport 2> /dev/null
}

# See how we were called.
case "$1" in
  start)
        # Start driver if it isn't already up.
	if [ ! -d /proc/asound ]; then
	  start
	else
	  echo "ALSA driver is already running."
	fi
        ;;
  stop)
        # Stop daemons.
	if [ -d /proc/asound ]; then
#          echo -n "Shutting down sound driver."
	  terminate
	  stop
	fi
        ;;
  restart|reload)
	$0 stop
	$0 start
	;;
  status)
        if [ -d /proc/asound ]; then
          echo -n "ALSA sound driver loaded."
        else
          echo -n "ALSA sound driver not loaded."
        fi
        echo
        ;;
  *)
        echo "Usage: alsasound {start|stop|restart|status}"
        exit 1
esac

exit 0

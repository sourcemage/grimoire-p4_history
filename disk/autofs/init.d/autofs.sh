#! /bin/bash
#
# rc file for automount using a Sun-style "master map".
# We first look for a local /etc/auto.master, then a YP
# map with that name
#

# Location of the automount daemon and the init directory
#
DAEMON=/usr/sbin/automount

# check if program is installed
#
test -x $DAEMON || exit 5

PATH=/sbin:/usr/sbin:/bin:/usr/bin
export PATH

# We can add local options here
# e.g. localoptions='rsize=8192,wsize=8192'
#
localoptions=''

#
# Daemon options
# e.g. --timeout 60
#
daemonoptions=

# normal behavior of ps, please.
#
unset PS_PERSONALITY
unset CMD_ENV

# This function will build a list of automount commands to execute in
# order to activate all the mount points. It is used to figure out
# the difference of automount points in case of a reload
#
function getmounts()
{
#
# Check for local maps to be loaded
#
if [ -f /etc/auto.master ]
then
    # We remove not only comments, but also "/-" since it stands for
    # direct mounts which autofs doesn't support yet.
    cat /etc/auto.master | sed -e '/^#/d' -e '/^$/d' -e '/^\/-[ \t]/d' | (
	while read dir map options
	do
	    if [ ! -z "$dir" -a ! -z "$map" \
			-a x`echo "$map" | cut -c1` != 'x-' ]
	    then
		map=`echo "/etc/$map" | sed -e 's:^/etc//:/:'`
		options=`echo "$options" | sed -e 's/\(^\|[ \t]\)-/\1/g'`
		if echo $options | grep -- '-t' >/dev/null 2>&1 ; then
                    mountoptions="--timeout $(echo $options | \
                    sed 's/^.*-t\(imeout\)*[ \t]*\([0-9][0-9]*\).*$/\2/g')"
		else
		    mountoptions=""
                fi
                options=`echo "$options" | sed -e '
                  s/--*t\(imeout\)*[ \t]*[0-9][0-9]*//g
                  s/\(^\|[ \t]\)-/\1/g'`
		if [ -x $map ]; then
		    echo "$DAEMON $daemonoptions $mountoptions $dir program $map $options $localoptions"
		elif [ -f $map ]; then
		    echo "$DAEMON $daemonoptions $mountoptions $dir file $map $options $localoptions"
		else
		    echo "$DAEMON $daemonoptions $mountoptions $dir yp `basename $map` $options $localoptions"
		fi
	    fi
	done
    ) | sed 's/ \+/ /g'
fi
}

#
# Status lister.
#
function status()
{
	echo "Configured Mount Points:"
	echo "------------------------"
	getmounts
	echo ""
	echo "Active Mount Points:"
	echo "--------------------"
	ps -C automount -o command= | grep "^$DAEMON "
}

# return true if at least one pid is alive
function alive()
{
    if [ -z "$*" ]; then
	return 1
    fi
    for i in $*; do
	if kill -0 $i 2> /dev/null; then
	    return 0
	fi
    done

    return 1
}

# See how we were called.
#
return=0

case "$1" in
  start)
	# Check if the automounter is already running?
	#
	if [ ! -f /var/lock/subsys/autofs ]; then
	    echo "Starting service automounter"
	    getmounts | sh || return=1
	    touch /var/lock/autofs
	fi
	;;
  stop)
	pids=$(/bin/pidof $DAEMON)
        kill -TERM $pids 2> /dev/null && sleep 1
        count=1
        while alive $pids; do
            sleep 5
            count=$(expr $count + 1)
            if [ $count -gt 5 ]; then
                echo "Giving up on automounter"
                break;
            fi
            echo "Automounter not stopped yet: retrying... (attempt $count)"
        done
        if [ $count -gt 1 -a $count -le 10 ]; then
            echo "Automounter stopped"
        fi
        rm -f /var/lock/autofs
        ;;

  reload|restart)
	if [ ! -f /var/lock/autofs ]; then
		echo "Automounter not running"
		exit 1
	fi
	echo "Checking for changes to /etc/auto.master ...."
        TMP1=`mktemp /tmp/autofs.XXXXXX` || { echo "could not make temp file" >& 2; exit 1; }
        TMP2=`mktemp /tmp/autofs.XXXXXX` || { echo "could not make temp file" >& 2; exit 1; }
	getmounts >$TMP1
	ps -C automount -o pid=,command= | grep " $DAEMON " | (
	    while read pid command; do
		echo "$command" >>$TMP2
		if ! grep -q "^$command" $TMP1; then
		    (
			while kill -USR2 $pid; do
			    sleep 3
			done
		    ) &> /dev/null
		    echo "Stop $command"
		fi
	    done
	)
	( while read x; do
		if ! grep -q "^$x" $TMP2; then
			$x
			echo "Start $x"
		fi
        done ) < $TMP1
	rm -f $TMP1 $TMP2
	;;
  status)
        status
	;;
  *)
	echo "Usage: $initdir/autofs {start|stop|restart|reload|status}"
	exit 1
esac

exit 0


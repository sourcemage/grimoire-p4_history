#!/bin/bash

PROGRAM=/bin/loadkeys
RUNLEVEL=S
NEEDS="+local_fs"
RECOMMENDED=yes

. /etc/init.d/smgl_init
. /etc/sysconfig/keymap

start()
{
  required_executable /bin/loadkeys

  /bin/loadkeys $KEYMAP
  evaluate_retval

  if [ -e "/usr/bin/consolechars" ] && [ "$ENABLE_EURO" = "yes" ] ; then
    /bin/loadkeys euro.inc
    evaluate_retval
  fi

  if [ -e "/usr/bin/consolechars" ] &&
     [[ "$CONSOLECHARS_ARGS" && "$TTY_NUMS" ]] ; then
    required_executable /usr/bin/consolechars
    for n in $TTY_NUMS ; do
      echo "Setting console settings for tty$n..."
      /usr/bin/consolechars $CONSOLECHARS_ARGS --tty=/dev/tty$n
      evaluate_retval
    done
  fi

  if [ -e "/usr/bin/setfont" ] &&
     [[ "$SETFONT_ARGS" && "$TTY_NUMS" ]] ; then
    required_executable /usr/bin/setfont
    for n in $TTY_NUMS ; do
      echo "Setting console settings for tty$n..."
      /usr/bin/setfont $SETFONT_ARGS -C /dev/tty$n
      evaluate_retval
    done
  fi

}

stop()
{
  echo  "Cannot stop keymap"
}

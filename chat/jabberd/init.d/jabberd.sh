#!/bin/bash
 
. /etc/sysconfig/apache
 
PROGRAM=/bin/false
RUNLEVEL=3
NEEDS="+network +remote_fs"
PIDFILE=/dev/null
 
. /etc/init.d/smgl_init
 
start()
{
  echo 'Starting Jabber Daemon...'
  /usr/bin/jabberd -D &
  evaluate_retval
}
 
stop()
{
  echo 'Stopping Jabber Daemon - C2S...'      && killproc c2s     ; evaluate_retval
  echo 'Stopping Jabber Daemon - SM...'       && killproc sm      ; evaluate_retval
  echo 'Stopping Jabber Daemon - Resolver...' && killproc resolver; evaluate_retval
  echo 'Stopping Jabber Daemon - Router...'   && killproc router  ; evaluate_retval
}
 
status()
{
  getpids router  ; [ -n "$pidlist" ] && echo 'Jabber C2S process ID(s): $pidlist'
  getpids resolver; [ -n "$pidlist" ] && echo 'Jabber SM  process ID(s): $pidlist'
  getpids sm      ; [ -n "$pidlist" ] && echo 'Jabber Res process ID(s): $pidlist'
  getpids c2s     ; [ -n "$pidlist" ] && echo 'Jabber Rtr process ID(s): $pidlist'
}
 
reload()
{
  run_func restart
}

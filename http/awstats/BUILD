(

  DOCUMENTROOT=/usr/share/$SPELL &&
  prepare_install &&

  mkdir -p             /var/spool/awstats &&
  chown nobody.nogroup /var/spool/awstats &&

  mv wwwroot/cgi-bin/awstats.model.conf /etc/ &&
  if ! [ -f /etc/awstats.conf ]; then
    cp /etc/awstats.model.conf /etc/awstats.conf
  fi &&

  mkdir -p                     $DOCUMENTROOT &&
  cp -R wwwroot/{cgi-bin,icon} $DOCUMENTROOT/

) >$C_FIFO 2>&1

awstats_copy_conf() {
  mv  wwwroot/cgi-bin/awstats.model.conf  wwwroot/ &&
  if  [ ! -f /etc/awstats.conf ];  then
    sedit 's:DirIcon="/icon":DirIcon="/icons":'  wwwroot/awstats.model.conf &&
    cp  wwwroot/awstats.model.conf  /etc/awstats.conf
  fi
}

(

  DOCUMENTROOT=/usr/share/$SPELL &&
  prepare_install                                    &&
  mkdir  -p              /var/spool/awstats          &&
  chown  nobody.nogroup  /var/spool/awstats          &&
  awstats_copy_conf                                  &&
  cp  -R  wwwroot/cgi-bin/*  $DOCUMENTROOT/cgi-bin/  &&
  cp  -R  wwwroot/icon/*     $DOCUMENTROOT/icons/

) >$C_FIFO 2>&1

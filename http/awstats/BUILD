awstats_copy_conf() {
  mv  wwwroot/cgi-bin/awstats.model.conf  wwwroot/
  if  [ ! -f /etc/awstats.conf ];  then
    sedit 's:DirIcon="/icon":DirIcon="/icons":'  wwwroot/awstats.model.conf
    cp  wwwroot/awstats.model.conf  /etc/awstats.conf
  fi
}

(
  if    spell_installed  apache-mod_ssl;  then DOCUMENTROOT=/usr/share/httpsd
  elif  spell_installed  apache;          then DOCUMENTROOT=/usr/share/httpd
  elif  spell_installed  apache2;         then DOCUMENTROOT=/usr/share/apache2
  fi

  prepare_install                                    &&
  mkdir  -p              /var/spool/awstats          &&
  chown  nobody.nogroup  /var/spool/awstats          &&
  awstats_copy_conf                                  &&
  cp  -R  wwwroot/cgi-bin/*  $DOCUMENTROOT/cgi-bin/  &&
  cp  -R  wwwroot/icon/*     $DOCUMENTROOT/icons/
) > $C_FIFO 2>&1

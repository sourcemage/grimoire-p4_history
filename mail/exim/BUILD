if [ "${EXISCAN}"  ==  "yes" ]
then
  message  "${MESSAGE_COLOR}Patching for exiscan${DEFAULT_COLOR}"  &&
  bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1
fi  &&

IVER=$( installed_version  exim |  cut  -c1  )
if    [  "$IVER"  ==  "3"  ]
then  if    [  -e  /etc/exim.conf  ]
      then  mv     /etc/exim.conf  /etc/exim.conf.$IVER
      fi
fi

create_account exim
create_account mail

mkdir  -p             /var/spool/mail
chmod  1777           /var/spool/mail
chown      exim:exim  /var/spool/mail
[  -e                 /var/spool/mail/db      ]  &&
chown  -R  exim:exim  /var/spool/mail/db
[  -e                 /var/spool/mail/input   ]  &&
chown  -R  exim:exim  /var/spool/mail/input
[  -e                 /var/spool/mail/log     ]  &&
chown  -R  exim:exim  /var/spool/mail/log
[  -e                 /var/spool/mail/msglog  ]  &&
chown  -R  exim:exim  /var/spool/mail/msglog

chown  -R  exim:exim  /var/spool/mail/db     /var/spool/mail/db/*
chown  -R  exim:exim  /var/spool/mail/input  /var/spool/mail/input/*
chown  -R  exim:exim  /var/spool/mail/log    /var/spool/mail/log/*
chown  -R  exim:exim  /var/spool/mail/msglog /var/spool/mail/msglog/*
chgrp      exim       /var/spool/mail/*

mkdir  -p  Local

if  spell_installed  xfree86;  then
  cp  src/EDITME           Local/Makefile
  cp  exim_monitor/EDITME  Local/eximon.conf
else
   grep  -v  "EXIM_MONITOR="  src/EDITME  >  Local/Makefile
fi

if  spell_installed  tcp_wrappers;  then
  echo  "USE_TCP_WRAPPERS=yes"  >> Local/Makefile
  echo  "EXTRALIBS=-lwrap"      >> Local/Makefile
fi

if  spell_installed  Linux-PAM;  then
  echo  "SUPPORT_PAM=yes"  >>  Local/Makefile
  if  spell_installed  tcp_wrappers
  then  echo  "EXTRALIBS=-lpam -ldl -lwrap"  >>  Local/Makefile  
  else  echo  "EXTRALIBS=-lpam -ldl"         >>  Local/Makefile  
  fi
fi

if  spell_installed  mysql;  then
  echo  "LOOKUP_MYSQL=yes"                     >>  Local/Makefile
  echo  "LOOKUP_INCLUDE=-I /usr/include/mysql" >>  Local/Makefile
  echo  "LOOKUP_LIBS=-lmysqlclient"            >>  Local/Makefile
fi


echo  "BIN_DIRECTORY=/usr/sbin"          >>  Local/Makefile
echo  "CONFIGURE_FILE=/etc/exim.conf"    >>  Local/Makefile
echo  "SPOOL_DIRECTORY=/var/spool/mail"  >>  Local/Makefile
echo  "LOG_FILE_PATH=/var/log/exim_%s:"  >>  Local/Makefile
echo  "CFLAGS=$CFLAGS"                   >>  Local/Makefile
echo  "EXIM_UID=`id -u exim`"            >>  Local/Makefile
echo  "EXIM_GID=`id -g exim`"            >>  Local/Makefile
echo  "EXIM_USER=exim"                   >>  Local/Makefile
echo  "EXIM_GROUP=exim"                  >>  Local/Makefile


(

  make             &&
  prepare_install  &&
  make    install  &&

  if [ "${EXISCAN}"  ==  "yes" ]
  then
    mkdir  -p  /usr/doc/${SPELL}/exiscan-acl                         &&
    cp  ${SOURCE_CACHE}/${SOURCE3}  /usr/doc/${SPELL}/exiscan-acl    &&
    cp  ${SOURCE_CACHE}/${SOURCE4}  /usr/doc/${SPELL}/exiscan-acl
  fi

) > $C_FIFO 2>&1  &&  (

# copy usefull convert tool
  message "Look @ /usr/doc/exim/doc for convert tools..."
  cp -v src/convert*.src doc/

  ln     -sf  ../sbin/exim   /usr/lib/sendmail
  ln     -sf  exim          /usr/sbin/sendmail
  ln     -sf  exim          /usr/sbin/mailq
  ln     -sf  exim          /usr/sbin/rsmtp
  ln     -sf  exim          /usr/sbin/rmail
  ln     -sf  exim          /usr/sbin/runq
  ln     -sf  exim          /usr/sbin/newaliases

  if    !  touch  /etc/aliases
  then  rm  -f    /etc/aliases
        touch     /etc/aliases
  fi

  sedit  "s:var/mail:var/spool/mail:"         /etc/exim.conf
  sedit  "s/\# group = exim/  group = exim/"  /etc/exim.conf
  sedit  "s/\# mode = 0660/  mode = 0660/"    /etc/exim.conf

# install man page
  cp $SOURCE_DIRECTORY/doc/exim.8 /usr/man/man8/exim.8

)

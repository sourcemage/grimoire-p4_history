IVER=$( installed_version  exim |  cut  -c1  )
if    [  "$IVER"  ==  "3"  ]
then  if    [  -e  /etc/exim.conf  ]
      then  mv     /etc/exim.conf  /etc/exim.conf.$IVER
      fi
fi

groupadd  mail            2>/dev/null
useradd   mail  -g  mail  2>/dev/null

mkdir  -p             /var/spool/mail
chmod  1777           /var/spool/mail
chown      mail:mail  /var/spool/mail
[  -e                 /var/spool/mail/db      ]  && 
chown  -R  mail:mail  /var/spool/mail/db
[  -e                 /var/spool/mail/input   ]  &&
chown  -R  mail:mail  /var/spool/mail/input
[  -e                 /var/spool/mail/log     ]  &&
chown  -R  mail:mail  /var/spool/mail/log
[  -e                 /var/spool/mail/msglog  ]  &&
chown  -R  mail:mail  /var/spool/mail/msglog

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
echo  "CFLAGS=$CFLAGS"                   >>  Local/Makefile
echo  "EXIM_UID=`id -u mail`"            >>  Local/Makefile
echo  "EXIM_GID=`id -g mail`"            >>  Local/Makefile
echo  "EXIM_USER=mail"                   >>  Local/Makefile
echo  "EXIM_GROUP=mail"                  >>  Local/Makefile


(
  db_ver=`gaze version db | grep db | cut -b35-37`

  if [ "$db_ver" == "4.1" ]; then
    message "${MESSAGE_COLOR}It seems you're running 4.1.x db series..."
    message "exim should not compile with db 4.1.x without being patched.${DEFAULT_COLOR}"
  
    if query "Apply unofficial patch to make exim db 4.1.x compliant ?" y
    then
      cd src           
      patch < $SCRIPT_DIRECTORY/db-4.1.patch
      cd ..
    fi
  fi
)                  &&
(

  make             &&
  prepare_install  &&
  make    install

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
  sedit  "s/\# group = mail/  group = mail/"  /etc/exim.conf
  sedit  "s/\# mode = 0660/  mode = 0660/"    /etc/exim.conf

# install man page
  cp $SOURCE_DIRECTORY/doc/exim.8 /usr/man/man8/exim.8

)

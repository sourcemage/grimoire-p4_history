(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam  --with-pam_smbpass"
  fi

  cd  source
  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --with-smbmount       \
               --with-fhs            \
               $WITH_PAM             \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  mkdir  -p  /etc/samba              &&
  mkdir  -p  /usr/share/samba        &&
  mkdir  -p  /var/log/samba          &&
  make    install                    
  
  if [ ! -e /etc/init.d/samba.sh ]; then

    cp $SCRIPT_DIRECTORY/samba.sh /etc/init.d/
  fi

  if [ ! -e /etc/rc0.d/K50samba ]; then

    cd /etc/rc0.d
    ln -s ../init.d/samba.sh K50samba
  fi

  if [ ! -e /etc/rc1.d/K50samba ]; then
  
    cd /etc/rc1.d
    ln -s ../init.d/samba.sh K50samba
  fi
  
  if [ ! -e /etc/rc2.d/K50samba ]; then

    cd /etc/rc2.d
    ln -s ../init.d/samba.sh K50samba
  fi
  
  if [ ! -e /etc/rc6.d/K50amba ]; then
  
    cd /etc/rc6.d
    ln -s ../init.d/samba.sh K50samba
  fi

  if [ ! -e /etc/rc3.d/S50samba ]; then
  
    cd /etc/rc5.d
    ln -s ../init.d/samba.sh S50samba
  fi
  
  if [ ! -e /etc/rc4.d/S50samba ]; then

    cd /etc/rc4.d
    ln -s ../init.d/samba.sh S50samba
  fi
  
  if [ ! -e /etc/rc5.d/S50samba ]; then
  
    cd /etc/rc5.d
    ln -s ../init.d/samba.sh S50samba
  fi

) > $C_FIFO 2>&1  &&  (

  if  [  -d  /usr/private  ];  then
    rmdir    /usr/private
    true
  fi

)

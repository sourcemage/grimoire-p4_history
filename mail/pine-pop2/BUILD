(

 if  spell_installed  openssl;  then
   if    spell_installed  Linux-PAM
   then  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  lnp
   else  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  slx
   fi  
 else
   if    spell_installed  Linux-PAM
   then  ./build  DEBUG="$CFLAGS"  lnp
   else  ./build  DEBUG="$CFLAGS"  slx
   fi 
 fi

 prepare_install			&&

 cd  bin				&&
 cp  ipop2d  /usr/sbin			&&

 cd  ../doc				&&

 if  spell_installed  stunnel;  then
   ln  -sf  stunnel.pem  /etc/ssl/certs/imapd.pem
   ln  -sf  stunnel.pem  /etc/ssl/certs/ipop3d.pem
 fi

) > $C_FIFO 2>&1

 if  spell_ok  openssl;  then
   if    spell_ok  linux-pam
   then  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  lnp
   else  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  slx
   fi  
 else
   if    spell_ok  linux-pam
   then  ./build  DEBUG="$CFLAGS"  lnp
   else  ./build  DEBUG="$CFLAGS"  slx
   fi 
 fi

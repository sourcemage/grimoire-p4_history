(

  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

#Basically the contents of autogen.sh with a few bugfixes
touch config.h.in
aclocal
#Deal with lack of proper files
touch NEWS README AUTHORS ChangeLog
automake --add-missing
autoconf

  ./configure --prefix=${INSTALL_ROOT}/usr
# No need for the following, the just create error messages
#          --sysconfdir=${INSTALL_ROOT}/etc
#       --localstatedir=${INSTALL_ROOT}/var
#              --mandir=${INSTALL_ROOT}/usr/share/man
#             --infodir=${INSTALL_ROOT}/usr/share/info
                       $OPTS                 &&
  make                                       &&
  make install				     

) > $C_FIFO 2>&1

if  echo  $OPTS  |  grep  -q  enable-pam;  then
  MAKEFLAG='CPPFLAGS=-DUSE_PAM su_LDFLAGS=-lpam_misc'         
fi  &&

./configure                                  \
   --build=$BUILD                            \
   --bindir=${INSTALL_ROOT}/bin              \
   --prefix=${INSTALL_ROOT}/usr              \
   --mandir=${INSTALL_ROOT}/usr/share/man    \
   --infodir=${INSTALL_ROOT}/usr/share/info  \
   $OPTS                                     &&

make  $MAKEFLAG

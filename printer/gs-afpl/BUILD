[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

sedit  "s:CFLAGS_STANDARD=@OPT_CFLAGS@:CFLAGS_STANDARD=$CFLAGS:g"        Makefile.in  &&
sedit  "s:CFLAGS_PROFILE=-pg @OPT_CFLAGS@:CFLAGS_PROFILE=-pg $CFLAGS:g"  Makefile.in  &&

./configure  --prefix=${INSTALL_ROOT}/usr                                   \
             --sysconfdir=${INSTALL_ROOT}/etc                               \
             --localstatedir=${INSTALL_ROOT}/var                            \
             --mandir=${INSTALL_ROOT}/usr/share/man                         \
             --infodir=${INSTALL_ROOT}/usr/share/info                       \
             $OPTS                                                          &&

make_single                                                                 &&
make                                                                        &&

if  [  "$GS_AFPL_LIBGS"  =  "y"  ];  then
  make  so
fi

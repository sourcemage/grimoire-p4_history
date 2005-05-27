patch  -p1  Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&

sedit "s:prefix =:prefix = ${INSTALL_ROOT}:" Makefile   &&
IR=`echo $INSTALL_ROOT | sed 's/\\//\\\\\\//g'`         &&
sedit "s/^exec_prefix.*$/exec_prefix = $IR/" Makefile   &&
sedit "s/^V=false$/V=true/" Makefile                    &&

if ( echo ${OPTS} |grep -q UDEV_SELINUX ); then
sedit "s/^USE_SELINUX = false/USE_SELINUX = true/" Makefile
fi &&

if ( echo ${OPTS} |grep -q UDEV_SYSLOG ); then
sedit "s/^USE_LOG = true/USE_LOG = false/" Makefile
fi  &&

make

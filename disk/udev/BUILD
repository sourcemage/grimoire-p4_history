patch  -p1  Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&

sedit "s:prefix =:prefix = ${INSTALL_ROOT}:" Makefile   &&
IR=`echo $INSTALL_ROOT | sed 's/\\//\\\\\\//g'`         &&
sed "s/^exec_prefix.*$/exec_prefix = $IR/" -i Makefile  &&

if [ "${UDEV_SELINUX}" == "y" ]; then
sed "s/^USE_SELINUX = false/USE_SELINUX = true/" -i Makefile
fi
if [ "${UDEV_LOG}" == "n" ]; then
sed "s/^USE_LOG = true/USE_LOG = false/" -i Makefile
fi

make

(
[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

    ./configure --prefix=${INSTALL_ROOT}/usr  \
    --sysconfdir=${INSTALL_ROOT}/etc  \
    --localstatedir=${INSTALL_ROOT}/var  \
    --mandir=${INSTALL_ROOT}/usr/share/man   \
    --infodir=${INSTALL_ROOT}/usr/share/info  \
    $OPTS                                      &&
    make                                       &&
case $CLAMDMAIL in
y|Y|j|J) cd clamdmail*                                  &&
  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

    ./configure --prefix=${INSTALL_ROOT}/usr  \
    --sysconfdir=${INSTALL_ROOT}/etc  \
    --localstatedir=${INSTALL_ROOT}/var  \
    --mandir=${INSTALL_ROOT}/usr/share/man   \
    --infodir=${INSTALL_ROOT}/usr/share/info  \
    $OPTS                                      &&
    make                                       &&
    make    install                            ;;   
*) true
esac
cd $SOURCE_DIRECTORY &&
prepare_install &&
make install &&
case $CLAMDMAIL in
y|Y|j|J) cd clamdmail* &&
	make install;; 
*) true;;
esac

CONF=/etc/freshclam.conf
if [ ! -f "$CONF" ]
then
     cp $SOURCE_DIRECTORY/etc/freshclam.conf $CONF
fi

CONF=/etc/clamav.conf
if [ ! -f "$CONF" ]
then
     cp $SOURCE_DIRECTORY/etc/freshclam.conf $CONF
fi

) > $C_FIFO 2>&1

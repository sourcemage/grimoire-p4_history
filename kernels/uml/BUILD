CFG_BACKUP="$CONFIG_CACHE/user-mode-linux.config"

cd  linux-$VERSION                                      &&

echo  "Applying User Mode Linux patch..."               &&
unpack  $SOURCE2   ${MD5[1]}                            &&
bzcat  $SOURCE_CACHE/$SOURCE2  |  patch  -p1            &&

gccVer=$( installed_version gcc )

if [[ $gccVer == 3.3* ]] && [[ $VERSION == 2.4.20 ]] ; then
  echo "Applying gcc3.3 patch to kernel source..."      &&
  unpack  $SOURCE3   ${MD5[2]}                          &&
  bzcat  $SOURCE_CACHE/$SOURCE3  |  patch  -p1
fi

if  [  -f  $CFG_BACKUP  ]  ;  then
  cp  $CFG_BACKUP  .config
fi                                                      &&

if  [  !  -f  .config  ]  ||  query  "Run menuconfig?"  n  ;  then
  make  ARCH=um  menuconfig
else
  yes  n  |  make  ARCH=um  oldconfig
fi                                                      &&

cp  .config  $CFG_BACKUP                                &&

(

  make  ARCH=um  linux                                  &&
  prepare_install                                       &&
  install  -v  -m 755  linux  $INSTALL_ROOT/usr/bin/user-mode-linux

) > $C_FIFO 2>&1

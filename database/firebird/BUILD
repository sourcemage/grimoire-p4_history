# make a shell script to start the server
#mkfbmgr()
#{
#  cat <<EOF
##!/bin/sh
#FIREBIRD=$PREFIX
#export FIREBIRD
#exec \$FIREBIRD/bin/fbmgr.bin \$@
#EOF
#}

(
# Classic Server install needs services or xinet.d
# Super Server install needs init.d
# at present the build only works for everything in one directory 
# tree /usr/firebird

  PREFIX=${INSTALL_ROOT}/usr/firebird		&&

# fix compiler flags
#"s/-O3 -march=i586 -mcpu=i686/$CFLAGS/;s/-ggdb//;s/-fno-builtin//;s/-fno-omit-frame-pointer//" \
  sed -i -e \
"s/-O3 -march=i586 -mcpu=i686//;s/-ggdb/$CFLAGS/;s/-shared/-shared $LDFLAGS/" \
	builds/posix/prefix.linux		&&

# make this compatible with smgl init system
  FF=src/install/arch-specific/linux/misc/changeDBAPassword.sh.in&&
  sed -e "s:rc\.d/::;s:d/f:d/runlevels/\%3/f:" -i $FF &&

  echo install=$INST				&&

  NOCONFIGURE=1 . ./autogen.sh			&&
  ./configure 				\
	--prefix=$PREFIX 		\
	--with-editline			\
	$OPTS					&&
  make 						&&

  prepare_install				&&

# new install script from here on
  cd gen					&&
  ./install/makeInstallImage.sh			&&
#  cd ..						&&
#  cd $PWD/gen/buildroot/${INSTALL_ROOT}		&&
  cd buildroot/${INSTALL_ROOT}/$PREFIX		&&
# preserve some existing files
  for FF in `ls security.fdb firebird.conf aliases.conf bin/*.sh`; do
    if [ -f $PREFIX/$FF ];then
      echo preserving file $FF
      rm $FF
    fi
  done						&&
  
  cd $OLDPWD/buildroot/${INSTALL_ROOT}	&&

  cp -rd * ${INSTALL_ROOT}/  			&&

# fix permissions
  cd $PREFIX					&&
# For security reasons initially force all root:root non-writable
  chown -R root:root $PREFIX			&&
  chmod -R uga-w $PREFIX			&&
  
  cd bin					&&
# Create the fbmgr shell script
#  mkfbmgr > fbmgr				&&

# Everyone may execute clients
  chmod 0555 *					&&

# Shell scripts changing security attributes are for root only
  chmod 0500 *.sh				&&

  cd ..						&&

# Security database
# Nobody besides firebird permitted to even read this file
  chown firebird:firebird security.fdb		&&
  chmod 0600 security.fdb			&&
# all database should be owned by firebird
  chmod ug+w examples/*.fdb			&&
  chown firebird:firebird examples/*.fdb	&&
# create lock files
  for i in isc_init1 isc_lock1 isc_event1 isc_guard1
    do
      FileName=$i.`hostname`
      touch $FileName
      chown firebird:firebird $FileName
      chmod u+w $FileName
    done					&&

# log file
  mkdir -p /var/log/				&&
  touch  /var/log/firebird.log			&&
  chown firebird:firebird /var/log/firebird.log	&&
  chmod o=,ug=rw /var/log/firebird.log		&&
  ln -sf /var/log/firebird.log ./
  
) > $C_FIFO 2>&1

(

  if  grep UTS_RELEASE /usr/include/linux/version.h | grep -q \"2.6; then
    patch  -p1  <  $SCRIPT_DIRECTORY/linux-2.6.patch
  fi  &&
  patch  -p1  <  ${SCRIPT_DIRECTORY}/htb3.6_tc.diff  &&
  sedit  's!-I\.\./include-glibc!!'  Makefile        &&
  sedit  's/-O2//'  Makefile                         &&
  sedit  's/<db\.h>/<db_185.h>/'  misc/arpd.c        &&
  sedit  's!\$(DESTDIR)\$(DOCDIR)!/usr/doc/iproute2!g'  \
            $SOURCE_DIRECTORY/doc/Makefile  &&
  
  make  &&
  if  spell_installed teTeX  &&  spell_installed psutils  \
      &&  spell_installed linuxdoc-tools ;  then
    cd $SOURCE_DIRECTORY/doc   &&
    make                       &&
    mkdir -p /usr/doc/iproute2
  fi                           &&
  prepare_install              &&
  make install                 &&   # install docs
  cd $SOURCE_DIRECTORY         &&
  cp ./ip/ip /usr/sbin         &&
  cp ./ip/rtmon /usr/sbin      &&
  cp ./tc/tc /usr/sbin

) > $C_FIFO 2>&1

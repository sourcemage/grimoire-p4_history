(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/htb3.6_tc.diff                                &&
  patch  -p1  <  ${SCRIPT_DIRECTORY}/iproute2-2.4.7-now-ss020116-try-2.4.22.patch  &&
  #sedit  's:db.h:db_cxx.h:'  misc/arpd.c  &&

  make  &&
  if spell_installed teTeX    &&
     spell_installed psutils; then
    cd $SOURCE_DIRECTORY/doc  &&
    make
  fi                       &&
  cd $SOURCE_DIRECTORY     &&
  prepare_install          &&
  cp ./ip/ip /usr/sbin     &&
  cp ./ip/rtmon /usr/sbin  &&
  cp ./tc/tc /usr/sbin

) > $C_FIFO 2>&1

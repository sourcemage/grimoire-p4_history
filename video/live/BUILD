(

  sedit  's/strstream.h/strstream/'  groupsock/Groupsock.cpp     &&
  sedit  's/strstream.h/strstream/'  groupsock/NetInterface.cpp  &&
  sedit  's/ -O / '"$CFLAGS"' -Wno-deprecated /'  config.linux   &&
  ./genMakefiles  linux                         &&
  make                                          &&
  prepare_install                               &&
  
  INSTALL_DIR=${INSTALL_ROOT}/usr/lib/live      &&
  mkdir  -p  $INSTALL_DIR                       &&
  for  lib  in  liveMedia groupsock UsageEnvironment BasicUsageEnvironment; do
    mkdir  -p             $INSTALL_DIR/$lib     &&
    cp  $lib/lib$lib.a    $INSTALL_DIR/$lib     &&
    cp  -R  $lib/include  $INSTALL_DIR/$lib
  done

) > $C_FIFO 2>&1


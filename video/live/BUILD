(

  sedit  's/strstream.h/strstream/'  groupsock/Groupsock.cpp     &&
  sedit  's/strstream.h/strstream/'  groupsock/NetInterface.cpp  &&
  sedit  's/ -O / '"$CFLAGS"' -Wno-deprecated /'  config.linux   &&
  ./genMakefiles  linux                         &&
  make                                          &&
  prepare_install                               &&
  
  mkdir  -p  /usr/lib/live                      &&
  for  lib  in  liveMedia groupsock UsageEnvironment BasicUsageEnvironment; do
    mkdir  -p             /usr/lib/live/$lib    &&
    cp  $lib/lib$lib.a    /usr/lib/live/$lib    &&
    cp  -R  $lib/include  /usr/lib/live/$lib
  done

) > $C_FIFO 2>&1


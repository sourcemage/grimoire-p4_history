sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  configure     &&
sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  settings.pro  &&
./configure                                             &&
make_single                                             &&
qmake  mythtv.pro                                       &&
#
# Supposedly allows multiple make jobs and distcc, but it fails...
#
#make  qmake                 &&
#make  -C  libs/libavcodec   &&
#make  -C  libs/libavformat  &&
#make  -C  libs/libmyth      &&
#make  -C  libs/libmythtv    &&
#make  -C  libs              &&
make

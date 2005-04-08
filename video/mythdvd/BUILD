sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  configure     &&
sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  settings.pro  &&
./configure  --enable-transcode --enable-vcd            &&
make_single                                             &&
qmake  mythdvd.pro                                      &&
make                                                    &&
make_normal

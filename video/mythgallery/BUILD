sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  configure     &&
sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  settings.pro  &&
./configure  $OPTS                                      &&
make_single                                             &&
qmake  mythgallery.pro                                  &&
make                                                    &&
make_normal

if  [  "$OPENGL"  =  "y"  ];  then
  OPTS="$OPTS  --enable-opengl"
fi  &&

sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  configure     &&
sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  settings.pro  &&
./configure  $OPTS                                      &&
qmake  mythgallery.pro                                  &&
make

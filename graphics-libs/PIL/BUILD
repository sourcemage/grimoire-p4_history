(

  cd  libImaging                                                   &&
  #  Ignores  $OPTS
  ./configure                                                      &&
  make                                                             &&
  cd  ..                                                           &&
# a fix for some variable scoping problem in thier setup.py
  mv setup.py set1.py                                              &&
  sed -e '/HAVE_TCLTK = 0/a\
EXTRA_COMPILE_ARGS = None\
EXTRA_LINK_ARGS = None' set1.py > setup.py &&
  python  setup.py  build                                          &&
  prepare_install                                                  &&
  cd  libImaging                                                   &&
  cp  ImConfig.h  ImPlatform.h  Imaging.h  /usr/include/python$(installed_version Python|cut -d . -f 1,2)  &&
  cd  ..                                                           &&
  python  setup.py  install

) > $C_FIFO 2>&1

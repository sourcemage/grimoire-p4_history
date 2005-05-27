(

  sedit   's:include/qt3:include/qt:'  qcadlib/src/qcadlib.pro  &&
  export  QTDIR=/usr                                            &&
  export  QMAKESPEC=${QTDIR}/share/qt/mkspecs/linux-g++         &&

  INSTALL="install  -o  root  -g  root"                         &&
  Q_DIR="/usr/share/qcad"                                       &&

  for i in fparser dxflib
  do
    echo  $i >> /tmp/test
    cd  $i       &&
    ./configure  &&
    make         &&
    cd  ..
  done           &&

  echo "before qcadcmd..."
  cd qcadcmd    &&
  make prepare  &&
  cd ..         &&
 
  for i in qcadlib qcadcmd qcadactions qcadguiqt qcad
  do
    cd  $i                                                       &&
    sedit   's:/include:/include /usr/include/qt :'  src/$i.pro  &&
    make                                                         &&
    cd  ..
  done                                                           &&

  cd scripts                                                    &&
  bash ./release_translations.sh                                &&
  prepare_install                                               &&
  cd  ${SOURCE_DIRECTORY}/qcad                                  &&
  ${INSTALL}  -m755  -d  ${Q_DIR}                               &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/examples                      &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/fonts                         &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/patterns                      &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/qm                            &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/scripts                       &&
  ${INSTALL}  -m755  -d  ${Q_DIR}/scripts/python                &&
  ${INSTALL}  -m644  examples/*  ${Q_DIR}/examples              &&
  ${INSTALL}  -m644  fonts/*  ${Q_DIR}/fonts                    &&
  ${INSTALL}  -m644  patterns/*  ${Q_DIR}/patterns              &&
  ${INSTALL}  -m644  scripts/python/*  ${Q_DIR}/scripts/python  &&
  ${INSTALL}  -m644  qm/*  ${Q_DIR}/qm                          &&
  ${INSTALL}  -m755  qcad  /usr/bin                             &&
  cd  ..                                                        &&
  cp  -r  partlibrary-${P_VERSION}  ${Q_DIR}/libraries          &&
  chown  -R  root.root  ${Q_DIR}

) > $C_FIFO 2>&1

(

  export  CFLAGS="-Wall -W -fno-strength-reduce  $CFLAGS"  &&

  Q_DIR="/usr/share/qcad"                      &&
  bzcat $SCRIPT_DIRECTORY/Makefile > Makefile  &&
  make                                         &&
  prepare_install                              &&
  install  -d  $Q_DIR  &&
  install  -d  $Q_DIR/cur  &&
  install  -d  $Q_DIR/examples  &&
  install  -d  $Q_DIR/fonts  &&
  install  -d  $Q_DIR/messages/old  &&
  install  -d  $Q_DIR/hatches  &&
  install  -d  $Q_DIR/po  &&
  install  -d  $Q_DIR/libraries/hydraulics/symbols  &&
  install  -d  $Q_DIR/libraries/mechanical/bearing/ball  &&
  install  -d  $Q_DIR/libraries/mechanical/bearing/cone_roll  &&
  install  -d  $Q_DIR/libraries/mechanical/bearing/shaft_nut  &&
  install  -d  $Q_DIR/libraries/mechanical/notches  &&
  install  -d  $Q_DIR/libraries/mechanical/nuts  &&
  install  -d  $Q_DIR/libraries/mechanical/screws/chc  &&
  install  -d  $Q_DIR/libraries/mechanical/screws/hex  &&
  install  -d  $Q_DIR/libraries/mechanical/screws/in_hex  &&
  install  -d  $Q_DIR/libraries/mechanical/tapers/ansi  &&
  install  -d  $Q_DIR/libraries/mechanical/tapers/brown\&sharpe  &&
  install  -d  $Q_DIR/libraries/mechanical/tapers/jarno/internal  &&
  install  -d  $Q_DIR/libraries/mechanical/tapers/morse/internal  &&
  install  -d  $Q_DIR/libraries/mechanical/threads/external  &&
  install  -d  $Q_DIR/libraries/mechanical/threads/internal  &&
  install  -d  $Q_DIR/libraries/mechanical/washers  &&
  install  -d  $Q_DIR/libraries/misc/bicycle/Kettenblatt  &&
  install  -d  $Q_DIR/libraries/misc/bicycle/Ritzel  &&
  install  -d  $Q_DIR/libraries/misc/bicycle/Taschen  &&
  install  -d  $Q_DIR/libraries/misc/igus  &&
  install  -d  $Q_DIR/libraries/templates/de  &&
  install  -d  $Q_DIR/libraries/templates/en  &&
  install  -d  $Q_DIR/libraries/templates/fr  &&
  install  -d  $Q_DIR/libraries/templates/pt  &&
  install  -m  644  cur/*.cur  $Q_DIR/cur      &&
  install  -m  644  examples/*.dxf  $Q_DIR/examples  &&
  install  -m  644  fonts/*.cxf  $Q_DIR/fonts  &&
  install  -m  644  fonts/*.txt  $Q_DIR/fonts  &&
  install  -m  644  messages/*.qm  $Q_DIR/messages  &&
  install  -m  644  messages/*.lang  $Q_DIR/messages  &&
  install  -m  644  messages/old/*.qm  $Q_DIR/messages/old  &&
  install  -m  644  hatches/*.dxf  $Q_DIR/hatches  &&
  install  -m  644  po/*.po  $Q_DIR/po  &&
  install  -m  644  po/*.ts  $Q_DIR/po  &&
  install  -m  644  po/*.pot  $Q_DIR/po  &&
  install  -m  644  libraries/hydraulics/symbols/*.dxf  $Q_DIR/libraries/hydraulics/symbols  &&
  install  -m  644  libraries/mechanical/bearing/ball/*.dxf  $Q_DIR/libraries/mechanical/bearing/ball  &&
  install  -m  644  libraries/mechanical/bearing/cone_roll/*.dxf  $Q_DIR/libraries/mechanical/bearing/cone_roll  &&
  install  -m  644  libraries/mechanical/bearing/shaft_nut/*.dxf  $Q_DIR/libraries/mechanical/bearing/shaft_nut  &&
  install  -m  644  libraries/mechanical/notches/*.dxf  $Q_DIR/libraries/mechanical/notches  &&
  install  -m  644  libraries/mechanical/nuts/*.dxf  $Q_DIR/libraries/mechanical/nuts  &&
  install  -m  644  libraries/mechanical/screws/chc/*.dxf  $Q_DIR/libraries/mechanical/screws/chc  &&
  install  -m  644  libraries/mechanical/screws/hex/*.dxf  $Q_DIR/libraries/mechanical/screws/hex  &&
  install  -m  644  libraries/mechanical/screws/in_hex/*.dxf  $Q_DIR/libraries/mechanical/screws/in_hex  &&
  install  -m  644  libraries/mechanical/tapers/jarno/internal/*.dxf  $Q_DIR/libraries/mechanical/tapers/jarno/internal  &&
  install  -m  644  libraries/mechanical/tapers/morse/internal/*.dxf  $Q_DIR/libraries/mechanical/tapers/morse/internal  &&
  install  -m  644  libraries/mechanical/threads/external/*.dxf  $Q_DIR/libraries/mechanical/threads/external  &&
  install  -m  644  libraries/mechanical/threads/internal/*.dxf  $Q_DIR/libraries/mechanical/threads/internal  &&
  install  -m  644  libraries/mechanical/washers/*.dxf  $Q_DIR/libraries/mechanical/washers &&
  install  -m  644  libraries/misc/bicycle/Kettenblatt/*.dxf  $Q_DIR/libraries/misc/bicycle/Kettenblatt  &&
  install  -m  644  libraries/misc/bicycle/Ritzel/*.dxf  $Q_DIR/libraries/misc/bicycle/Ritzel  &&
  install  -m  644  libraries/misc/bicycle/Taschen/*.dxf  $Q_DIR/libraries/misc/bicycle/Taschen  &&
  install  -m  644  libraries/misc/bicycle/*.dxf  $Q_DIR/libraries/misc/bicycle  &&
  install  -m  644  libraries/misc/igus/*.dxf  $Q_DIR/libraries/misc/igus  &&
  install  -m  644  libraries/misc/*.dxf  $Q_DIR/libraries/misc  &&
  install  -m  644  libraries/templates/de/*.dxf  $Q_DIR/libraries/templates/de  &&
  install  -m  644  libraries/templates/en/*.dxf  $Q_DIR/libraries/templates/en  &&
  install  -m  644  libraries/templates/fr/*.dxf  $Q_DIR/libraries/templates/fr  &&
  install  -m  644  libraries/templates/pt/*.dxf  $Q_DIR/libraries/templates/pt  &&
  install  -m  755  qcad  $Q_DIR  &&
  ln  -s  $Q_DIR/qcad  /usr/bin/qcad

) > $C_FIFO 2>&1

(

  export  XERCESCROOT=$SOURCE_DIRECTORY

  if  echo $OPTS | grep -q 'ticu'; then
     export  ICUROOT=/usr
  fi               &&

  cd  src/xercesc  &&
  autoconf         &&
  
  chmod u+x runConfigure configure install-sh
  ./runConfigure  -plinux -cgcc -xg++ -minmem  \
          -nsocket -rpthread                   \
          $OPTS                                \
          -P /usr                              &&
  
  make             &&
  prepare_install  &&
  make  install    &&

  # needed for libpathan
  mkdir -p          /usr/include/xercesc/dom/impl &&
  cp dom/impl/*.hpp /usr/include/xercesc/dom/impl/
  
) >$C_FIFO 2>&1

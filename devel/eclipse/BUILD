(

  # TODO define arch and windowing system
  # possible values are in ./build
  ws=gtk                                                               &&
  if uname -m | grep -q 'i.\+86'; then
    arch=x86
  fi                                                                   &&
  ./build -os linux -ws "$ws" -arch "$arch"                            &&
  echo '/usr/share/eclipse/eclipse -data ~/workspace' > eclipse-script &&
  chmod 755 eclipse-script                                             &&

  prepare_install                                               &&
  mkdir -p                                   /usr/share/eclipse &&
  unzip -o result/linux-$ws-$arch-sdk.zip -d /usr/share         &&
  cp eclipse-script                          /usr/bin/eclipse   &&

  if [ "$SSH2" = "y" ] ; then
    unzip ${SOURCE_CACHE}/${SOURCE2} -d ${INSTALL_ROOT}/usr/share/eclipse/plugins
  fi  

) >$C_FIFO 2>&1

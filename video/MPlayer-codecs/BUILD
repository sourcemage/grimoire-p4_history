(

  prepare_install  &&

  if [ -d qt6dlls ]; then
    mkdir -p /usr/lib/win32
    install qt6dlls/* /usr/lib/win32
  fi

  if [ -d xanimdlls ]; then
    mkdir -p /usr/lib/xanim
    install xanimdlls/* /usr/lib/xanim
  fi

  if [ -d rp9codecs ]; then
    mkdir -p /usr/lib/RealPlayer8/Codecs
    install rp9codecs/* /usr/lib/RealPlayer8/Codecs
  fi

) > $C_FIFO 2>&1

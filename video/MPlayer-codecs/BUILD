(

  if [ -d dmocodecs ]; then
    mkdir  -p  /usr/lib/win32
    install dmocodecs/* /usr/lib/win32
  fi

  if [ -d mjpeg2kdlls ]; then
    mkdir  -p  /usr/lib/win32
    install mjpeg2kdlls/* /usr/lib/win32
  fi
  
  if [ -d qt6dlls ]; then
    mkdir -p /usr/lib/win32
    install qt6dlls/* /usr/lib/win32
  fi

  if [ -d xanimdlls ]; then
    mkdir -p /usr/lib/xanim
    install xanimdlls/* /usr/lib/xanim
  fi

  if [ -d rp9codecs ]; then
    mkdir -p /usr/lib/real
    install rp9codecs/* /usr/lib/real
  fi

) > $C_FIFO 2>&1

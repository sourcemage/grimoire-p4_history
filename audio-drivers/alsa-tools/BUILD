(
  
  config_get_option "ALSATOOLS" i

  if  [  "$i"  ==  "seq"  ]; then
    cd $SOURCE_DIRECTORY/$i/sbiload
  else
    cd $SOURCE_DIRECTORY/$i
  fi

  message "${MESSAGE_COLOR}We will now build the $i tool..."
  message "${DEFAULT_COLOR}"

  ./configure  --prefix=/usr         \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make install
    
) > $C_FIFO 2>&1  

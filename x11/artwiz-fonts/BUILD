  rm -rf /tmp/artwiz-fonts                              &&
  cd /tmp                                               &&
  unpack $SOURCE                                        &&

(

  prepare_install                                            &&
  mkdir "$DIR" 2>/dev/null                                   
  install -m 644 -o root -g root /tmp/artwiz-fonts/* "$DIR"  &&
  rm -rf /tmp/artwiz-fonts                                   &&
  mkfontdir "$DIR"

)  >  $C_FIFO

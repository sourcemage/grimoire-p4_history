(
  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/powertweakd.sh  /etc/init.d
  ln      -sf ../init.d/powertweakd.sh  /etc/rcS.d/S20powertweakd
  ln      -sf ../init.d/powertweakd.sh  /etc/rc0.d/K70powertweakd
  ln      -sf ../init.d/powertweakd.sh  /etc/rc6.d/K70powertweakd

)

(

  sedit  '299s/;//'  src/oidentd_cfg_parse.y  &&
  default_build

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/oidentd.sh  /etc/init.d

  ln  -sf     ../init.d/oidentd.sh   /etc/rc3.d/S99oidentd
  ln  -sf     ../init.d/oidentd.sh   /etc/rc4.d/S99oidentd
  ln  -sf     ../init.d/oidentd.sh   /etc/rc5.d/S99oidentd

  ln  -sf     ../init.d/oidentd.sh   /etc/rc0.d/K01oidentd
  ln  -sf     ../init.d/oidentd.sh   /etc/rc6.d/K01oidentd

)

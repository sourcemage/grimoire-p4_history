(

  make    oldconfig  &&
  make    all        &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1  &&  (

  ln  -s  ../init.d/pcmcia  /etc/rc3.d/S25pcmcia
  ln  -s  ../init.d/pcmcia  /etc/rc4.d/S25pcmcia
  ln  -s  ../init.d/pcmcia  /etc/rc5.d/S25pcmcia

  ln  -s  ../init.d/pcmcia  /etc/rc0.d/K75pcmcia
  ln  -s  ../init.d/pcmcia  /etc/rc6.d/K75pcmcia

)

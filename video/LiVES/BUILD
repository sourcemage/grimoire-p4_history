(

  default_build  &&

  mkdir  -p  /usr/share/lives  &&
  tar xfz lives-plugins-$VERSION.tar.gz -C /usr/share/lives  &&
  tar xfz lives-themes-$VERSION.tar.gz  -C /usr/share/lives  &&
  chown -R root:root /usr/share/lives                        &&

  install  -m 755  smogrify  /usr/bin

) > $C_FIFO 2>&1

(

  ./configure  --build=$BUILD  &&
  make                         &&
  prepare_install              &&
  make    install

)  > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/modutils.sh  /etc/init.d
  ln  -sf  ../init.d/modutils.sh  /etc/rcS.d/S20modutils

  mkdir  -p  /etc/modules.d
  touch      /etc/modules
  touch      /etc/modules.conf

  echo  "Customize /etc/modules.conf
         Execute depmod.
         List all modules that should load
         during boot in /etc/modules"

)

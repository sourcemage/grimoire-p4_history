( 

  mkdir  -p  /usr/X11R6/lib/modules/drivers
  mkdir  -p  /usr/X11R6/lib/modules/extensions
  mkdir  -p  /usr/X11R6/include/GL

  prepare_install                              &&
  make    install                              &&
  cp    -d  /usr/lib/libGL*   /usr/X11R6/lib

  # Are the header files worth installing or do they cause problems?
  #   &&
  #  cp    -a  usr/include/GL/*  /usr/include/GL

) > $C_FIFO 2>&1

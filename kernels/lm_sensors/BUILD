(

  make                            &&
  prepare_install                 &&
  make  I2C_HEADERS=/usr/include  \
        PREFIX=/usr               \
        install                   &&
  prog/mkdev/mkdev.sh             &&
  # ignore depmod errors
  (  depmod  -a  ||  true  )

) > $C_FIFO 2>&1

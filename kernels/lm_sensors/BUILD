(
if [[ $(uname -r) == 2.4.* ]] ; then
  make                            &&
  prepare_install                 &&
  make I2C_HEADERS=/usr/include   \
       PREFIX=${INSTALL_ROOT}/usr \
       install                    &&
  prog/mkdev/mkdev.sh             &&
  # ignore depmod errors
  (  depmod  -a  ||  true  )
elif [[ $(uname -r) == 2.6.* ]]; then
  make user                       &&
  prepare_install                 &&
  make PREFIX=${INSTALL_ROOT}/usr user_install &&
  prog/mkdev/mkdev.sh             
fi
) > $C_FIFO 2>&1

(

  if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
    patch -p1 < $SCRIPT_DIRECTORY/libggi-gcc3.3.patch
  fi  &&
  default_build

)  >  ${C_FIFO}  2>&1

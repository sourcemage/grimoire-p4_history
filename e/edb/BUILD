(
  if [ "$CVS" = "y" ]; then
    ./autogen.sh  &&
    default_build
  else
    default_build
  fi
) > $C_FIFO 2>&1

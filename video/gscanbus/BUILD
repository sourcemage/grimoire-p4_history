(
  if [[ $(installed_version gcc) == 3.3 ]]; then
    patch -p0 < $SCRIPT_DIRECTORY/gscanbus.patch
  fi
default_build
) > $C_FIFO 2>&1

(
  patch -p0 <$SPELL_DIRECTORY/cf.diff	&&
  cd src				&&
  patch -p0 <$SPELL_DIRECTORY/src.diff  &&
  cd ..					&&
  autoconf				&&
  default_build

) > $C_FIFO 2>&1

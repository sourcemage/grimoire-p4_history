(
cp $SCRIPT_DIRECTORY/Configure   \
   $BUILD_DIRECTORY/$SPELL.dir      &&
  ./Configure                       \
               $OPTS                &&
  make                              &&
  make    install

) > $C_FIFO 2>&1

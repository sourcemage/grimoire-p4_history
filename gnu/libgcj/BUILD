  cd $SOURCE_DIRECTORY.bld                                &&

# now the specific envionment for the java library

  for DD in fastjar boehm-gc libffi libjava;  do
    mkdir -p $DD                                         &&
    cd  $DD
    $SOURCE_DIRECTORY/$DD/configure                       \
               --prefix=${INSTALL_ROOT}/usr               \
               --enable-threads=posix                     \
               --enable-shared --disable-static             \
               --enable-objc-gc                           \
               --with-system-zlib                         \
	       $OPTS                                     &&

    make CFLAGS="$CFLAGS" BOOT_CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
       GCC_FLAGS_TO_PASS="$CFLAGS"                        &&
    cd ..
  done

  cd $SOURCE_DIRECTORY.bld                                &&

# now the specific envionment for the Fortran library
  $SOURCE_DIRECTORY/libf2c/configure                      \
               --prefix=${INSTALL_ROOT}/usr               \
	       $OPTS                                      &&
#               --enable-languages=f77                        


  make CFLAGS="$CFLAGS" BOOT_CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
       GCC_FLAGS_TO_PASS="$CFLAGS" 
#maybe-all-target-libf2c   

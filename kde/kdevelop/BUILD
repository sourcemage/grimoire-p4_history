(
  if ${INSTALL_ROOT}/lib/libc.so.6 | grep -q NPTL; then
     sedit "s/X_CFLAGS -ldb/X_CFLAGS -ldb -lpthread/" configure 
  fi                                         &&
  ./configure  --prefix=${INSTALL_ROOT}/usr  \
           --sysconfdir=${INSTALL_ROOT}/etc  \
        --localstatedir=${INSTALL_ROOT}/var  \
              --disable-debug                \
               --enable-final                \
               --enable-autoproject          \
               --enable-scriptproject        \
               --enable-trollproject         \
               --enable-customproject        \
                        ${OPTS}              &&
  make  -Wno-deprecated                      &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1

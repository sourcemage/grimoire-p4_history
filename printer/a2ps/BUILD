patch -p1 < $SCRIPT_DIRECTORY/path-concat.c.patch &&
patch -p0 <$SCRIPT_DIRECTORY/config.sub.patch &&

  ./configure  --prefix=${INSTALL_ROOT}/usr              \
               --sysconfdir=${INSTALL_ROOT}/etc/a2ps     \
               --infodir=${INSTALL_ROOT}/usr/share/info  \
               --mandir=${INSTALL_ROOT}/usr/share/man    \
               $OPTS                                  &&
  make                                                

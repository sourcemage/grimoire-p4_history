sedit  "s/gzip/gzip -f/"  Makefile.in     &&

/configure  --prefix=${INSTALL_ROOT}/usr  \
            ${OPTS}                       &&
make                                      &&
# Compile fonts
cd  ${SOURCE2/.tar.bz2/}                  &&
make                                      &&
cd  ..

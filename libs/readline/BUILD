patch -p1 < $SCRIPT_DIRECTORY/readline-5.0-display_wrap-1.patch &&

./configure  --build=$BUILD                            \
             --prefix=${INSTALL_ROOT}/usr              \
             --libdir=${INSTALL_ROOT}/lib              \
             --infodir=${INSTALL_ROOT}/usr/share/info  \
             --mandir=${INSTALL_ROOT}/usr/share/man    \
             $OPTS                         &&
make

(
./configure  --build=$BUILD        \
             --prefix=${INSTALL_ROOT}/usr         \
             --sysconfdir=${INSTALL_ROOT}/etc     \
             --localstatedir=${INSTALL_ROOT}/var  \
             $MINEWS               \
             $OPTS                 &&
make all                           &&
prepare_install                    &&
make    install                    &&

cp   uulib/libuu.a      ${INSTALL_ROOT}/usr/lib    &&
cp   uulib/uudeview.h  ${INSTALL_ROOT}/usr/include &&

ln  -sf  uudeview    ${INSTALL_ROOT}/usr/bin/uudecode         &&
ln  -sf  uuenview    ${INSTALL_ROOT}/usr/bin/uuencode         &&
ln  -sf  uudeview.1  ${INSTALL_ROOT}/usr/man/man1/uudecode.1  &&
ln  -sf  uuenview.1  ${INSTALL_ROOT}/usr/man/man1/uuencode.1

) > $C_FIFO 2>&1

./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
             --enable-static-link          \
             $OPTS                         &&
make  bash                                 &&
mv    bash  bash.static                    &&
./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
             $OPTS                         &&
make

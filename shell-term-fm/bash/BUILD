./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
             --enable-static-link          \
	     --with-bash-malloc=no 	   \
             $OPTS                         &&
make  bash                                 &&
mv    bash  bash.static                    &&
./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
	     --with-bash_malloc=no         \
             $OPTS                         &&
make

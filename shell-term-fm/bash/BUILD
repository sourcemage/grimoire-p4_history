patch -p1 < $SCRIPT_DIRECTORY/bash-3.0-avoid_WCONTINUED-1.patch &&
patch -p1 < $SCRIPT_DIRECTORY/bash-3.0-display_wrap-1.patch &&

./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
             --enable-static-link          \
	     --with-bash-malloc=no 	   \
             $OPTS                         &&
make_single                                &&
make  bash                                 &&
mv    bash  bash.static                    &&
./configure  --build=$BUILD                \
             --prefix=${INSTALL_ROOT}/usr  \
             --bindir=${INSTALL_ROOT}/bin  \
	     --with-bash_malloc=no         \
             $OPTS                         &&
make

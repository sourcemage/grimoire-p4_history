invoke_gcc
mkdir  buildit
cd     buildit
#                --build=$BUILD                \

../configure  --host=$HOST                  \
              --prefix=/usr                 \
              --infodir=${INSTALL_ROOT}/usr/share/info     \
              --mandir=${INSTALL_ROOT}/usr/share/man       \
              $OPTS  &&
make

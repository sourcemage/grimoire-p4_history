bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1  &&

if [ ! -e /boot/grub ]; then
  mkdir /boot/grub
fi

unset CFLAGS
unset CXXFLAGS
CFLAGS="-Os -g" ; export CFLAGS

./configure  --build=$BUILD           \
            --prefix=/usr             \
           --sbindir=/sbin            \
            --mandir=/usr/share/man   \
           --infodir=/usr/share/info  \
           $OPTS                      &&
make


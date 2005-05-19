#do some magic
mv configure configure-moved &&
sed -i "s/configure/configure-moved/g" configure.sh &&
ln -s configure.sh configure &&
default_build
#  ./configure.sh --build=$BUILD        \
#                 --prefix=/usr         \
#                 --sysconfdir=/etc     \
#                 --localstatedir=/var  \
#                 $OPTS                 &&
#  make

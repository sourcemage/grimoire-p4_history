if [[ "$APR_CVS" == "y" ]]
then
	./buildconf
fi
./configure                                   \
  --host=$HOST                                \
  --build=$BUILD                              \
  --prefix=$INSTALL_ROOT/usr                  \
  --includedir=$INSTALL_ROOT/usr/include/apr  \
  --sysconfdir=$INSTALL_ROOT/etc              \
  --localstatedir=$INSTALL_ROOT/var           \
  --enable-layout=GNU                         \
  --enable-threads                            \
  $OPTS                                       &&

sedit  's|[^_]off64_t| __off64_t|'  include/apr.h  &&

make

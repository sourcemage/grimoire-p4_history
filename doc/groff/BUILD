./configure  --build=$BUILD        \
             --prefix=$INSTALL_ROOT/usr         \
             --sysconfdir=$INSTALL_ROOT/etc     \
             --localstatedir=$INSTALL_ROOT/var  \
             $OPTS                                  &&

if  ! spell_installed netpbm; then
    patch  < $SCRIPT_DIRECTORY/groff.patch
fi                                                  &&

make

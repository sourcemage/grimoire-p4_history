#
# patch for multiple signatures and allows selection.
#
if [ "$PATCH_SIGNATURE" == "y" ]; then
  patch -p1 < $SCRIPT_DIRECTORY/patch-1.4.0.cd.signatures_menu.2.1
fi  &&

#
# patch for trash bin.
#
if [ "$PATCH_TRASH" == "y" ]; then
  patch -p1 < $SCRIPT_DIRECTORY/patch-1.4.0.cd.trash_folder.3.1
fi  &&

./configure  --build=$BUILD                       \
             --prefix=${INSTALL_ROOT}/usr         \
             --sysconfdir=${INSTALL_ROOT}/etc     \
             --localstatedir=${INSTALL_ROOT}/var  \
             --enable-pop                         \
             --enable-imap                        \
             --with-mailpath=/var/spool/mail      \
             $OPTS                                &&
make

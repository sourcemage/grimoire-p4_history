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

#
# patch for libesmtp support
#
if [ "$PATCH_SMTP" == "y" ]; then 
  patch -p1 < $SCRIPT_DIRECTORY/patch-1.4.sde.libesmtp.3
  aclocal -I m4 && autoheader && (cd m4 && make -f Makefile.am.in) &&
  automake ; autoconf ;
  cd ${SOURCE_DIRECTORY} &&
  OPTS="${OPTS} --with-libesmtp"
fi &&

./configure  --build=$BUILD                       \
             --prefix=${INSTALL_ROOT}/usr         \
             --sysconfdir=${INSTALL_ROOT}/etc     \
             --localstatedir=${INSTALL_ROOT}/var  \
             --enable-pop                         \
             --enable-imap                        \
             --with-mailpath=/var/spool/mail      \
             --mandir=${INSTALL_ROOT}/usr/share/man  \
             --with-docdir=${INSTALL_ROOT}/usr/share/doc/mutt  \
             $OPTS                                &&
make

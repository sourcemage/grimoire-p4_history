(

patch -p1 <<EOF
--- a2ps-4.13.old/lib/path-concat.c	2002-03-04 13:46:25.000000000 -0500
+++ a2ps-4.13.new/lib/path-concat.c	2004-04-13 01:47:03.596895984 -0400
@@ -31,7 +31,7 @@
 #endif
 #include <sys/types.h>
 
-char *malloc ();
+/* char *malloc (); */
 
 #ifndef DIRECTORY_SEPARATOR
 # define DIRECTORY_SEPARATOR '/'
EOF

  ./configure  --prefix=${INSTALL_ROOT}/usr              \
               --sysconfdir=${INSTALL_ROOT}/etc/a2ps     \
               --infodir=${INSTALL_ROOT}/usr/share/info  \
               --mandir=${INSTALL_ROOT}/usr/share/man    \
               $OPTS                                  &&
  make                                                &&
  prepare_install                                     &&
  make    install                                     &&
  rm  -f  /a2ps*.el

) > $C_FIFO 2>&1

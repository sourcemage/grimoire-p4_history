(

  ./configure --prefix=/usr

  patch -p0 << EOF
--- Makefile    Thu Nov 22 10:21:45 2001
+++ Makefile    Thu Nov 22 10:25:20 2001
@@ -81,7 +81,7 @@
 POD2MAN = /usr/bin/pod2man
 POD2TEXT = /usr/bin/pod2text
 TCLTK_INCLUDES = 
-TCLTK_LIBS = -ltk -ltcl -ldl
+TCLTK_LIBS = -ltk8.3 -ltcl8.3 -ldl
 VERSION = 1.20
 
 AUTOMAKE_OPTIONS = 1.0 foreign

EOF

make             &&
prepare_install  &&
make    install

) > $C_FIFO 2>&1

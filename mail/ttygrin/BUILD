  (

<<EOF patch -p0 &&
--- Makefile	Mon Jan 28 12:36:17 2002
+++ Makefile	Mon Jan 28 12:36:28 2002
@@ -46,8 +46,8 @@
 
 install:
 	strip ttygrin
-	install -o 0 -g 0 -m 0755 ttygrin /usr/local/bin/ttygrin
-	install -o 0 -g 0 -m 0644 ttygrin.1 /usr/local/man/man1/ttygrin.1
+	install -o 0 -g 0 -m 0755 ttygrin /usr/bin/ttygrin
+	install -o 0 -g 0 -m 0644 ttygrin.1 /usr/man/man1/ttygrin.1
 
 uninstall:
-	/bin/rm -f /usr/local/bin/ttygrin /usr/local/man/man1/ttygrin.1
+	/bin/rm -f /usr/bin/ttygrin /usr/man/man1/ttygrin.1
EOF
make                            &&
prepare_install                 &&
make  install

  ) > $C_FIFO 2>&1


--- Makefile.orig	2004-11-18 11:51:47.000000000 +1300
+++ Makefile	2004-11-21 10:08:47.515924642 +1300
@@ -21,7 +21,7 @@
 all: dist
 
 # build and install everything into local dist directory
-dist: xen tools kernels docs
+dist: xen tools kbuild docs
 	install -m0644 ./COPYING $(DIST_DIR)
 	install -m0644 ./README $(DIST_DIR)
 	install -m0755 ./install.sh $(DIST_DIR)
@@ -48,12 +48,15 @@
 kernels:
 	for i in $(KERNELS) ; do $(MAKE) $$i-build ; done
 
+patchkrn:
+	for i in $(KERNELS) ; do $(MAKE) -f buildconfigs/mk.$$i xenify ; done
+
 docs:
 	sh ./docs/check_pkgs && \
 		$(MAKE) prefix=$(INSTALL_DIR) dist=yes -C docs install || true
 
 # Build all the various kernels and modules
-kbuild: kernels
+kbuild: patchkrn kernels
 
 # Delete the kernel build trees entirely
 kdelete:

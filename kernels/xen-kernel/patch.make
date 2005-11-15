--- Makefile.org	2005-11-15 10:54:48.963401688 +0100
+++ Makefile	2005-11-15 10:56:16.097155344 +0100
@@ -41,7 +41,7 @@
 	$(MAKE) -C docs build
 
 # build and install everything into local dist directory
-dist: xen tools kernels docs
+dist: xen tools kbuild docs
 	$(INSTALL_DIR) $(DISTDIR)/check
 	$(INSTALL_DATA) ./COPYING $(DISTDIR)
 	$(INSTALL_DATA) ./README $(DISTDIR)
@@ -57,11 +57,14 @@
 kernels:
 	for i in $(XKERNELS) ; do $(MAKE) $$i-build || exit 1; done
 
+patchkrn:
+	for i in $(KERNELS) ; do $(MAKE) -f buildconfigs/mk.$$i xenify ; done
+
 docs:
 	sh ./docs/check_pkgs && $(MAKE) -C docs install || true
 
 # Build all the various kernels and modules
-kbuild: kernels
+kbuild: patchkrn kernels
 
 # Delete the kernel build trees entirely
 kdelete:

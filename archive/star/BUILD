if [ "$SELINUX" == "y" ] && [ "$MD5_ok" == "y" ]; then
  patch -p1 < $SOURCE_DIRECTORY/star-selinux.patch  # no &&, because their patch is broken
  cd star &&
  patch -p0 Makefile < $SCRIPT_DIRECTORY/Makefile.patch &&
  cd ..
fi &&
sedit 's:/usr/src/linux/include::' DEFAULTS/Defaults.linux &&
make

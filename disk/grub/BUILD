(
  # Patches

  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.92-vga16.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.5.96.1-special-raid-devices.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.5.96.1-dont-give-mem-to-kernel.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.93-configfile.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-vga16-keypressclear.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-passwordprompt.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-install.in.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-installcopyonly.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-ensureserialsetup.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-staticcurses.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-md5cryptshell.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-installmktemp.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-symlinkmenulst.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-append.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-fixapm.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-nomd5passsegfault.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-addsyncs.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.90-reiserfsfixes.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-splashimagehelp.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-initrdusemem.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-fixcflags.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-displaymemconsistency.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-bootonce.patch || die
  patch -p1 < $SCRIPT_DIRECTORY/grub-0.92-automake16.patch || die
  patch -p0 < $SCRIPT_DIRECTORY/grub-0.92-nodeprecatedflags.patch || die
  #patch -p1 < $SCRIPT_DIRECTORY/grub-0.91-vga16-serial.patch || die

  # malign is obsolete
  sedit  's/malign-jumps/falign-jumps/'  configure          &&
  sedit  's/malign-loops/falign-loops/'  configure          &&
  sedit  's/malign-functions/falign-functions/'  configure  &&

  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  unset CFLAGS
  unset CXXFLAGS

  ./configure  --build=$BUILD                \
               --prefix=/usr                 \
               --sbindir=/sbin               \
               --mandir=/usr/share/man       \
               --infodir=/usr/share/info     \
               --disable-auto-linux-mem-opt  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&

  #  Sample image, replace with SMGL image
  cp  $SCRIPT_DIRECTORY/splash.xpm.gz  /boot/grub
  # this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1

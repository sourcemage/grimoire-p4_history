
(

  #just note this could be a version maintenance nightmare if they change their Makefiles between versions. ;)
  cd $SOURCE_DIRECTORY &&
  sedit "s/\/usr\/local\/share/\/usr\/share/g" Makefile  &&
  sedit "/cp -f -R .\/scenes \$(libdir)\//i \	install -d \$(libdir)/scenes" Makefile &&
  sedit "/cp -f -R .\/scenes \$(libdir)\//i \	install -d \$(libdir)/scenes/mechsim" Makefile &&
  sedit "/cp -f -R .\/scenes \$(libdir)\//i \	install -d \$(libdir)/include" Makefile &&
  sedit "/cp -f -R .\/scenes \$(libdir)\//i \	install -d \$(docdir)/manual" Makefile &&
  sedit "s/cp -f -R .\/scenes \$(libdir)\//install .\/scenes\/\*\.pov \$(libdir)\/scenes/" Makefile &&
  sedit "/install \.\/scenes\/\*\.pov \$(libdir)\/scenes/a \	install ./scenes/mechsim/*.pov \$(libdir)/scenes/mechsim" Makefile &&
  sedit "s/cp -f -R .\/include \$(libdir)\//install .\/include\/\* \$(libdir)\/include/" Makefile &&
# Someone who wants the manual can hack this to make the dirs and install the files (why doesn't install have a -R option ??? )
#  sedit "s/cp -f -R .\/manual\/\* \$(docdir)\//install .\/manual\/\* \$(docdir)\/manual/" Makefile &&
  sedit "/cp -f -R .\/manual\/\* \$(docdir)\//,1D" Makefile &&
  
  cd $SOURCE_DIRECTORY/unix &&
  sedit "s/prefix = \/usr\/local/prefix = \/usr/" Makefile &&
  sedit "s/installdir = \/usr\/local\/bin/installdir = \$(prefix)\/bin/" Makefile &&
  sedit "s/sysconfdir = \$(prefix)\/etc/sysconfdir = \/usr\/share\/megapov/" Makefile &&
  sedit "s/STATIC = -static/STATIC =/" Makefile  &&
  sedit "s/-I\/usr\/local\//-I\/usr\//g" Makefile &&
  sedit "s/all: disp/all: no_disp/" Makefile &&

  cd $SOURCE_DIRECTORY &&

  make             &&
  prepare_install  &&
  make    install  &&
#  mkdir /usr/share/megapov &&
#  mkdir /usr/share/megapov/include &&
#  cp $SOURCE_DIRECTORY/include/mechsim.inc /usr/share/megapov/include/ &&
#  cp $SOURCE_DIRECTORY/include/mp_functions.inc /usr/share/megapov/include/ &&
  cp $SCRIPT_DIRECTORY/povray.conf /usr/share/megapov/ &&
  cp $SCRIPT_DIRECTORY/povray.ini /usr/share/megapov/

) > $C_FIFO 2>&1

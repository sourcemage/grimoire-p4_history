( 
#If these switches are used, they stop distcc and ccache from working
#  We could write wrappers for all of the possible binaries
[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"
  
  # don't stomp on binutils
  sedit 's/bin_PROGRAMS = readelf nm size strip ld elflint/bin_PROGRAMS = elflint/' src/Makefile.in &&
  sedit 's/bin_PROGRAMS = readelf\$(EXEEXT) nm\$(EXEEXT) size\$(EXEEXT) strip\$(EXEEXT) \\/bin_PROGRAMS = elflint\$(EXEEXT)/' src/Makefile.in &&
  sedit 's/ld\$(EXEEXT) elflint\$(EXEEXT)//' src/Makefile.in &&

  ./configure --prefix=${INSTALL_ROOT}/usr  \
         --exec-prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                 &&
  make                                       &&
  prepare_install                            &&
  make    install                            

) > $C_FIFO 2>&1


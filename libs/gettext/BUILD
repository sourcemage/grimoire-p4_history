(
export CC=gcc   			              &&
  ./configure  --build=$BUILD                         \
               --host=$BUILD                          \
               --prefix=${INSTALL_ROOT}/usr           \
               --sysconfdir=${INSTALL_ROOT}/etc       \
               --with-included-gettext                \
               --includedir=${INSTALL_ROOT}/usr/local/include \
               $OPTS                                  &&
  make                                                &&
if spell_installed teTeX ; 
then cd gettext-tools/doc &&
     make dvi  &&
     make ps   &&
     make pdf  &&
     cd -     
fi  &&
 #Remove libintl.h from old log files
  (sedit '/libintl.h/d' $INSTALL_LOGS/gettext* || true) &&
  (sedit '/libintl.h/d' /var/log/sorcery/md5sum/gettext*  || true) &&
  prepare_install                       &&
  make    install                       &&
 #install headers so libintl.h doesn't get overwritten
  rm ${INSTALL_ROOT}/usr/local/include/libintl.h &&
  mv ${INSTALL_ROOT}/usr/local/include/{autosprintf.h,gettext-po.h} \
     ${INSTALL_ROOT}/usr/include/       &&
if spell_installed teTeX ; 
then cd gettext-tools/doc &&  
  make    install-pdf     &&
  make    install-ps      &&
  make    install-dvi
fi
) > $C_FIFO 2>&1

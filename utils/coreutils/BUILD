(
  ./configure                                  \
     --build=$BUILD                            \
     --bindir=${INSTALL_ROOT}/bin              \
     --prefix=${INSTALL_ROOT}/usr              \
     $OPTS                                     &&
  make                                         &&

# We need this directory in the path for the following utilities
# cut, dirname, tail, and uniq
  export PATH="$SOURCE_DIRECTORY/src:$PATH"    && 

  prepare_install                              &&

#horrible hack, some of my best work ;-)
  ./src/ginstall src/ginstall /bin/install     &&

  make    install                              &&

#some problems with everything in /bin
for i in \
    install env true ptx sha1sum split sum tac tr tsort unexpand wc basename dirname expr factor cut \
    uptime sort md5sum hostid id logname nice nohup pathchk pinky printenv printf seq sleep tee test \
    tty users who whoami yes ;
do  ln -sfn ${INSTALL_ROOT}/bin/$i ${INSTALL_ROOT}/usr/bin/$i
done                                           &&

#provided by other packages
rm -f ${INSTALL_ROOT}/bin/readlink             &&
rm -f ${INSTALL_ROOT}/bin/uptime               &&
rm -f ${INSTALL_ROOT}/usr/man/man1/uptime.1
) >$C_FIFO 2>&1

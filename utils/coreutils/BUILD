(
  patch -p1 < $SCRIPT_DIRECTORY/coreutils-cp-mv-oMFS-bug.patch &&
  ### patch for pam support in su
  if echo $OPTS | grep -q enable-pam; then
     message "${MESSAGE_COLOR} Linux-PAM is  enabled ${DEFAULT_COLOR}"   &&
     patch -p1 < $SCRIPT_DIRECTORY/coreutils-use-pam.patch     &&
     MAKEFLAG='CPPFLAGS=-DUSE_PAM su_LDFLAGS=-lpam_misc'         
  fi                                                           &&
  ./configure                                  \
     --build=$BUILD                            \
     --bindir=${INSTALL_ROOT}/bin              \
     --prefix=${INSTALL_ROOT}/usr              \
     $OPTS                                     &&
  make   $MAKEFLAG                             &&
  # We need this directory in the path for the following utilities
  # cut, dirname, tail, and uniq
  export PATH="$SOURCE_DIRECTORY/src:$PATH"    && 
  prepare_install                              &&
  #horrible hack, some of my best work ;-)
  ./src/ginstall  src/ginstall                 \
                  ${INSTALL_ROOT}/bin/install  &&
  make    install                              &&

#some problems with everything in /bin
for i in \
    install env ptx sha1sum split sum tac tr tsort unexpand dirname expr factor cut \
    sort md5sum hostid id logname nice nohup pathchk pinky printenv printf seq tee \
    tty users who whoami yes ;
do  ln -sfn ../../bin/$i ${INSTALL_ROOT}/usr/bin/$i
done &&

  mkdir -p ${INSTALL_ROOT}/etc/profile.d/ &&
  install -m 0644 $SCRIPT_DIRECTORY/coreutils.sh ${INSTALL_ROOT}/etc/profile.d/
) >$C_FIFO 2>&1

  sedit "s:install_sysv$:true:"  etc/install-etc  &&
  if [[ $(uname -r) == 2.6.* ]]
  then ./Configure --kernel=${INSTALL_ROOT}/usr/src/linux --srctree -n 
  else make    oldconfig
  fi                 &&
  make    all

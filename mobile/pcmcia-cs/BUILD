(
  if spell_installed module-init-tools; then
  sedit "s/MOD_RELEASE=\`\/sbin\/insmod/MOD_RELEASE=\`\/sbin\/insmod.old/" Configure
  fi  &&
  sedit "s:install_sysv$:true:"  etc/install-etc  &&
  if [[ $(uname -r) == 2.6.* ]]
  then ./Configure --kernel=/lib/modules/$(uname -r)/build --srctree -n 
  else make    oldconfig
  fi                 &&
  make    all        &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1

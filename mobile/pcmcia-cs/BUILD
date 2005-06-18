echo $(get_running_kernel_config CONFIG_PCCARD)
if [[ $(get_running_kernel_config CONFIG_PCCARD) != "y" ]] &&
   [[ $(get_running_kernel_config CONFIG_PCCARD) != "m" ]]
then
	message "${PROBLEM_COLOR}You don't have CONFIG_PCCARD enabled in your kernel${DEFAULT_COLOR}" &&
	return 1
fi

sedit "s:install_sysv$:true:"  etc/install-etc  &&
if [[ $(uname -r) == 2.6.* ]]
then 
  ./Configure --kernel=${INSTALL_ROOT}/usr/src/linux-$(uname -r) --srctree -n 
else 
  make    oldconfig
fi                 &&
make    all

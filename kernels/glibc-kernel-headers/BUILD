(
 if [[ $(uname -m) == *86_64 ]]; then
 ARCH=x86_64
 elif  [[ $(uname -m) == ppc ]]; then
 ARCH=ppc
 elif  [[ $(uname -m) == *86 ]]; then
 ARCH=i386
 elif  [[ $(uname -m) == *sparc64 ]]; then
 ARCH=sparc64
 elif  [[ $(uname -m) == *sparc ]]; then
 ARCH=sparc 
 fi                                                         &&
 prepare_install                                            &&
  ### remove these incase they didn't come from this spell then 
  ### clean up the glibc log in case glibc had provided these headers before
    rm -rf ${INSTALL_ROOT}/usr/include/{asm,asm-generic,linux} &&
    for i in $INSTALL_LOGS/glibc*
    do sedit '/\/usr\/include\/asm/D' $i &&
       sedit '/\/usr\/include\/linux/D' $i
    done
  ###
 echo "installing linux headers"                         &&
 cp -a linux ${INSTALL_ROOT}/usr/include                    &&
 echo "installing asm-generic headers"                   &&
 cp -a asm-generic ${INSTALL_ROOT}/usr/include              &&
 echo "installing asm-$ARCH headers to /usr/include/asm" &&
 cp -a asm-$ARCH ${INSTALL_ROOT}/usr/include/asm
 if [ "$KERN" = "2.6" ] &&  [[ $(uname -m) == *86 ]]; then
  if [ -f ${INSTALL_ROOT}/etc/sorcery/local/kernel.config ]; then
   PROCESSOR="#define CONFIG_X86_L1_CACHE_SHIFT $(grep CONFIG_X86_L1_CACHE_SHIFT \
${INSTALL_ROOT}/etc/sorcery/local/kernel.config | cut -d= -f2)" &&
  sedit "s:\#endif:$PROCESSOR\n\n\#endif:" ${INSTALL_ROOT}/usr/include/linux/config.h
  else PROCESSOR="#define CONFIG_X86_L1_CACHE_SHIFT 3" &&
  sedit "s:\#endif:$PROCESSOR\n\n\#endif:" ${INSTALL_ROOT}/usr/include/linux/config.h
  fi
 fi
)  >  $C_FIFO

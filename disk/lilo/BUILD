( if [[ $(grep UTS_RELEASE ${INSTALL_ROOT}/usr/include/linux/version.h | awk '{ print $3 }' | sed -e 's/"//g') == 2.6.* ]]
then unpack ${SOURCE2} ${MD5[1]} &&
     for i in asm asm-generic linux 
     do mount --bind $SOURCE_DIRECTORY/include/$i ${INSTALL_ROOT}/usr/include/$i 
     done
fi ) &&
(
  patch -p1 < $SCRIPT_DIRECTORY/headers.patch  &&
  make  ROOT=                                  &&
  prepare_install                              &&
  make  ROOT= install                                              

) > $C_FIFO 2>&1 
 exitcode=$?
 umount ${INSTALL_ROOT}/usr/include/{asm,asm-generic,linux}
 return $exitcode 

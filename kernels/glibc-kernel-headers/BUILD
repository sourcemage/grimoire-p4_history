(
 if [ "$KERN" != "2.4" ]; then
   cd  $SOURCE_DIRECTORY/include
 fi
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
 cp -R linux ${INSTALL_ROOT}/usr/include                    &&
 if [ "$KERN" = "2.4" ]; then
   echo "installing asm-generic headers"                   &&
   cp -R asm-generic ${INSTALL_ROOT}/usr/include
 fi  &&
 echo "installing asm-$ARCH headers to /usr/include/asm" &&
 cp -R asm-$ARCH ${INSTALL_ROOT}/usr/include/asm
)  >  $C_FIFO

(

  sh $SOURCE_CACHE/$SOURCE --extract-only &&
  cd $SOURCE_DIRECTORY/NVIDIA-Linux-x86-$VERSION/usr/src/nv                 &&

  ### We look at the Makefile in the kernel sources for the Version Number!
  KPATCHLEVEL=$(head -n 2 /lib/modules/$(uname -r)/build/Makefile | tail -n 1 | sed 's/.*= //')

  if [[ $KPATCHLEVEL == 5 ]]  || [[ $KPATCHLEVEL == 6 ]]
  then
    patch  -p1  <  $SOURCE_CACHE/$SOURCE2                   &&
    ln  -s  Makefile.kbuild Makefile
  fi                                                        &&
  ### please no-one remove this
  cd $SOURCE_DIRECTORY/NVIDIA-Linux-x86-$VERSION            &&
  
  if [[ $VIA4X == "y" ]]; then sedit "s/NVreg_EnableVia4x =0;/NVreg_EnableVia4x = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $ALiAGP == "y" ]]; then sedit "s/NVreg_EnableALiAGP = 0;/NVreg_EnableALiAGP = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $AGPSBA == "y" ]]; then sedit "s/NVreg_EnableAGPSBA = 0;/NVreg_EnableAGPSBA = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $AGPFW == "y" ]]; then sedit "s/NVreg_EnableAGPFW = 0;/NVreg_EnableAGPFW = 1;/" usr/src/nv/os-registry.c; fi &&


  prepare_install                                           &&
  mkdir -p ${INSTALL_ROOT}/usr/X11R6/lib/modules/drivers    &&
  mkdir -p ${INSTALL_ROOT}/usr/X11R6/lib/modules/extensions &&
  export IGNORE_CC_MISMATCH=1                               &&
  make install

) > $C_FIFO 2>&1

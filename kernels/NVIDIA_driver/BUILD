(

  sh $SOURCE_CACHE/$SOURCE --extract-only
  cd NVIDIA-Linux-x86-$VERSION
  
  if [[ $VIA4X == "y" ]]; then sedit "s/NVreg_EnableVia4x =0;/NVreg_EnableVia4x = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $ALiAGP == "y" ]]; then sedit "s/NVreg_EnableALiAGP = 0;/NVreg_EnableALiAGP = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $AGPSBA == "y" ]]; then sedit "s/NVreg_EnableAGPSBA = 0;/NVreg_EnableAGPSBA = 1;/" usr/src/nv/os-registry.c; fi &&

  if [[ $AGPFW == "y" ]]; then sedit "s/NVreg_EnableAGPFW = 0;/NVreg_EnableAGPFW = 1;/" usr/src/nv/os-registry.c; fi &&

  cd usr/src/nv                 &&
  if [[ $(installed_version linux|cut -d. -f1,2) == 2.5 ]]  ||
     [[ $(installed_version linux|cut -d. -f1,2) == 2.6 ]]
  then
    patch  -p1  <  $SOURCE_CACHE/$SOURCE2
    if ! grep -q KERNEL_2_6 nv-linux.h; then
      patch  -p0  <  $SOURCE_CACHE/$SOURCE3   # Workaround for stupid stupid stupid people who dont update versions.
    fi
    ln  -s  Makefile.kbuild Makefile
  fi                            &&
#please no-one remove this???
  cd $SOURCE_DIRECTORY/NVIDIA-Linux-x86-$VERSION &&

  prepare_install               &&
  export IGNORE_CC_MISMATCH=1   &&
  make install

) > $C_FIFO 2>&1

(

  export ESDL_PATH=/usr/lib/esdl
  WINGS3D_PATH=/usr/lib/wings3d
  make                                   &&
  prepare_install                        &&
  mkdir $WINGS3D_PATH                    &&
  cp -Rv ebin $WINGS3D_PATH              &&
  cp -Rv plugins $WINGS3D_PATH           &&
  cp license.terms $WINGS3D_PATH         &&
  cp $SCRIPT_DIRECTORY/wings3d /usr/bin

) > $C_FIFO 2>&1

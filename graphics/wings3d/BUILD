(

  sedit 's:GL_LIBS = -lGLU -lGL:GL_LIBS = -L/usr/X11R6/lib -lGLU -lGL:'  \
  plugins_src/accel/Makefile             &&

  export ESDL_PATH=/usr/lib/esdl         &&
  WINGS3D_PATH=/usr/lib/wings            &&
  make                                   &&
  prepare_install                        &&
  mkdir  -p  $WINGS3D_PATH               &&
  cp -Rv e3d $WINGS3D_PATH               &&
  cp -Rv ebin $WINGS3D_PATH              &&
  cp -Rv icons $WINGS3D_PATH             &&
  cp -Rv plugins $WINGS3D_PATH           &&
  cp -Rv plugins_src $WINGS3D_PATH       &&
  cp -Rv src $WINGS3D_PATH               &&
  cp license.terms $WINGS3D_PATH         &&
  cp $SCRIPT_DIRECTORY/wings3d /usr/bin

) > $C_FIFO 2>&1

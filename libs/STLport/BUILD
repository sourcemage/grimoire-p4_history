(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/STLport-4.5.3-gcc3.2.patch  &&

  #  Set compile to use STLport's headers before gcc's...

  PATH_HOLD=${PATH}                    &&
  export  PATH=${PWD}/stlport:${PATH}  &&
  echo  PATH = ${PATH}                 &&

  cd  src                                         &&
  cp  gcc.mak  Makefile                           &&
  sedit  's:\-O2:${CFLAGS}:'  Makefile            &&
  sedit  "s:/usr/local:/usr:"  common_macros.mak  &&
  make  clean  all                                &&
  prepare_install                                 &&
  make   install                                  &&

  export  PATH=${PATH_HOLD}

)  >  $C_FIFO  2>&1

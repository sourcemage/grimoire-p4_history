patch  -p1  <  $SCRIPT_DIRECTORY/transcode-gcc34.patch    &&

sedit  "s:avifile/:avifile-0.7/:"  import/af6_decore.cpp  &&
sedit  "s:avifile/:avifile-0.7/:"  export/export_af6.cpp  &&
sedit  "s:avifile/:avifile-0.7/:"  export/af6_aux.cpp     &&

default_build

(

  echo  ""
  echo  "Patching ntx.h:"
#  sedit  "s/nbNtx\:\://g"  $SOURCE_DIRECTORY/xbase/ntx.h  &&
  patch  -p0  <  $SCRIPT_DIRECTORY/ntx.h.patch  &&
  echo  "Done patching."
  echo  ""


  default_build

) > $C_FIFO 2>&1

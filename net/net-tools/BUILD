(

  cp  $CONFIG_CACHE/net-tools.config.h     config.h            &&
  cp  $CONFIG_CACHE/net-tools.config.make  config.make         &&

  make  COPTS="-D_GNU_SOURCE -Wall $CFLAGS"  LOPTS="$LDFLAGS"  &&
  prepare_install                                              &&
  make  BASEDIR=/  install

) > $C_FIFO 2>&1  &&  (

# clean up .temp files
for  scratch_file  in  $SCRIPT_DIRECTORY/*.temp  ;  do
    rm  -f  $scratch_file
done

)

(

  cp  $CONFIG_CACHE/net-tools.config.h  config.h  &&

  make COPTS="-D_GNU_SOURCE -Wall $CFLAGS" LOPTS="$LDFLAGS"  &&
  prepare_install                                            &&
  make  BASEDIR=/  install

) > $C_FIFO 2>&1  &&  (

. $SCRIPT_DIRECTORY/lib_runlevel

installscript hostname.sh
installscript networking.sh
# clean up .temp files
scratch_list=$(ls $SCRIPT_DIRECTORY | grep .temp)
for scratch_file in $scratch_list; do
    rm -f $SCRIPT_DIRECTORY/$scratch_file
done

)

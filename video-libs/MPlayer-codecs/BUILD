install_codec() {
  codec=$2
  target=$4
  if [ -d $2 ]; then
    mkdir -p $INSTALL_ROOT/usr/lib/$4
    install $2/* $INSTALL_ROOT/usr/lib/$4
  fi
}

. $SCRIPT_DIRECTORY/codecs

(

  prepare_install  &&

  for (( c=0; c < $num_codecs; c++ )); do
    install_codec ${codecs[$c]}
  done

) > $C_FIFO 2>&1

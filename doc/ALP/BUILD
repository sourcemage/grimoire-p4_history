INST_DIR=/usr/share/doc/$SPELL

(

  prepare_install                         &&
  mkdir -p  $INST_DIR                     &&
  cd        $SOURCE_DIRECTORY             &&
  cp        $SOURCE            $INST_DIR  &&
  cp -a     ALP-listings       $INST_DIR

) > $C_FIFO 2>&1

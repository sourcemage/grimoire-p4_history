(

  cd  /usr/src/linux  &&
  if [  -f  /tmp/sorcery.patching  ]; then
    echo "Applying $SPELL patch";
    bzcat  $SOURCE_CACHE/$SOURCE  |  patch  -p1
  else
    echo "$SPELL patch will be applied next time you cast linux-devel"
  fi

) > $C_FIFO 2>&1

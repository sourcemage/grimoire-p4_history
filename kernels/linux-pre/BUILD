(

  cd  /usr/src/linux  &&
  if [  -f  /tmp/sorcery.patching  ]; then
    echo "Applying $SPELL patch";
    bzcat  $SOURCE_CACHE/$SOURCE  |  patch  -p1 &&
    sedit 's/SUBLEVEL =.*/SUBLEVEL = 19/'
  else
    echo "$SPELL patch will be applied next time you cast linux"
  fi
  
) > $C_FIFO 2>&1

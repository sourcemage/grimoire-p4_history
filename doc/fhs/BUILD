(
  cd $SOURCE_DIRECTORY/groff
  
  if [ "$PS" == "y" ]; then
     groff -p -t -mm -Wall -M./tmac -Tps draft.mm > ../fhs.ps
  fi
  
  if [ "$DVI" == "y" ]; then
     groff -p -t -mm -Wall -M./tmac -Tdvi draft.mm > ../fhs.dvi
  fi

  if [ "$ASCII" == "y" ]; then
     groff -p -t -mm -Wall -M./tmac -Tascii draft.mm > ../fhs.txt
  fi

  if [ "$LATIN" == "y" ]; then
     groff -p -t -mm -Wall -M./tmac -Tascii draft.mm > ../fhs.doc
  fi

  prepare_install
  mkdir -p                          /usr/doc/$SPELL
  cp    -a $SOURCE_DIRECTORY/fhs.*  /usr/doc/$SPELL

) > $C_FIFO 2>&1  


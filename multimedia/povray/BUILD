(

  cd $SOURCE_DIRECTORY/source/unix                &&
  cp $SCRIPT_DIRECTORY/makefile .                 &&
  cp $SCRIPT_DIRECTORY/povrayrc .
  if spell_installed  xfree86; then
    echo  "Making x-povray..."
    make  newxwin
  fi
  if  spell_installed svgalib; then
    echo  "Making s-povray..."
    make  newsvga
  fi

  echo "Making povray..."
  make  newunix                                   &&
  prepare_install                                 &&
  make  install                                   &&
  cp $SOURCE_DIRECTORY/source/unix/povrayrc /etc  &&

  if  query  "Copy /etc/povrayrc to $HOME/.povrayrc for all users? " y
  then
    for USERS in `ls /home/`; do
      cp /etc/povrayrc /home/$USERS/.povrayrc
    done
  else
    echo 'You will need to put /etc/povrayrc into $HOME/.povrayrc for users'
  fi

) > $C_FIFO 2>&1

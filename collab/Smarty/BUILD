(
  prepare_install                  &&
  mkdir -p      /usr/share/$SPELL  &&
  cp    -r .    /usr/share/$SPELL/
    
) >$C_FIFO 2>&1 && (

  message "${MESSAGE_COLOR}Make sure PHP can locate /usr/share/$SPELL/libs/Smarty.class.php${DEFAULT_COLOR}"
  message "${MESSAGE_COLOR}or set SMARTY_DIR to '/usr/share/$SPELL/libs/'.${DEFAULT_COLOR}"

)

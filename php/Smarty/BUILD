(

  mkdir doc &&
  mv [A-Z][A-Z][A-Z]* misc demo doc/ &&

  prepare_install &&
  mkdir -p /usr/share/$SPELL &&
  cp -r libs/* /usr/share/$SPELL/ &&
  chmod -R u=rwX,og=rX /usr/share/$SPELL

) >$C_FIFO 2>&1 && (

  message "${MESSAGE_COLOR}Make sure PHP can locate /usr/share/$SPELL/Smarty.class.php${DEFAULT_COLOR}"
  message "${MESSAGE_COLOR}by including /usr/share/$SPELL in the include_path parameter.${DEFAULT_COLOR}"
  message "${MESSAGE_COLOR}You can also set SMARTY_DIR to '/usr/share/$SPELL/'.${DEFAULT_COLOR}"

)

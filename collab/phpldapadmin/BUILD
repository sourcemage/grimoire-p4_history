declare -r PHPLDAPADMIN_CONFIG=/etc/$SPELL-config.php

(

  prepare_install &&
  mkdir -p /usr/share/$SPELL &&
  cp -R . /usr/share/$SPELL/ &&
  mv /usr/share/$SPELL/config.php.example "$PHPLDAPADMIN_CONFIG.default" &&
  if ! [ -f "$PHPLDAPADMIN_CONFIG" ]; then
    cp "$PHPLDAPADMIN_CONFIG.default" "$PHPLDAPADMIN_CONFIG"
  fi &&
  ln -fns "$PHPLDAPADMIN_CONFIG" /usr/share/$SPELL/config.php
    
) >$C_FIFO 2>&1 && (

  message "Please point your Web server at /usr/share/$SPELL and adjust $PHPLDAPADMIN_CONFIG"

)

export OPTS="$OPTS --with-sys-screenrc=/etc/screenrc"  &&
default_build  &&
  if  [  -f  /etc/screenrc  ]; then
      if  [  "$REPLACE_RC" == "y"  ]; then
          cp  ${SCRIPT_DIRECTORY}/screenrc  /etc/screenrc
      else
          cp  ${SCRIPT_DIRECTORY}/screenrc  /etc/screenrc.new
      fi
  else
      cp  ${SCRIPT_DIRECTORY}/screenrc  /etc/screenrc
  fi

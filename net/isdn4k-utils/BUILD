config_isdn()  {

  if  [  -e  $CONFIG_CACHE/.config-$SPELL  ]  ;  then

    cp $CONFIG_CACHE/.config-$SPELL .config

    if  query  "Configure $SPELL? "  n  ;  then
      make  config
    else
      make subconfig
    fi

  else

    make  config

  fi

}


config_isdn
cp    .config  $CONFIG_CACHE/.config-$SPELL

# begin BAH!
cd capi20
autoreconf --force --install
cd ../capiinfo
autoreconf --force --install
cd ../capiinit
autoreconf --force --install
cd ../ipppd
patch  -p0  <  $SCRIPT_DIRECTORY/options.c.patch
cd ..
# end BAH!

(

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

unset LANG

# save current version so we can do a FINAL
#
CURRENT_VERSION="`installed_version perl`"  &&
CONFIG="$DEPENDS_CONFIG/perl_config.sh"     &&

if  [  "$OLD_CUSTOM"  ==  "y"  ];  then
  cp $CONFIG ./config.sh  &&
  ./Configure -S          &&
  make depend
else
  if  [  "$NEW_CUSTOM"  ==  "y"  ];  then
    ./Configure -Ui_db -Dprefix=/usr -Dvendorprefix=/usr  \
                -Dlibperl=libperl.so  &&
    cp config.sh $CONFIG
  else
    if  [  "$THREADED"  ==  "y"  ];  then
      ./Configure  -Dprefix=/usr -d -e                                   \
                   -Ui_db -Dvendorprefix=/usr -Dusethreads -Ulocincpth -Dlibperl=libperl.so
    else
      ./Configure  -Dprefix=/usr -d -e                      \
                   -Ui_db -Dvendorprefix=/usr -Ulocincpth -Dlibperl=libperl.so
    fi
  fi
fi  &&

make

unset LANG

# save current version so we can do a TRIGGERS
#
persistent_add PREVIOUS_VERSION	&&
PREVIOUS_VERSION="`installed_version perl`"  &&
CONFIG="$DEPENDS_CONFIG/perl_config.sh"     &&
VENDORMAN1DIR="/usr/share/man/man1perl"     &&
VENDORMAN3DIR="/usr/share/man/man3perl"     &&

if  [  "$OLD_CUSTOM"  ==  "y"  ];  then
  cp $CONFIG ./config.sh  &&
  ./Configure -S  -Dprefix=/usr -Dvendorprefix=/usr -Dvendorman1dir=$VENDORMAN1DIR  -Dvendorman3dir=$VENDORMAN3DIR   &&
  make depend
else
  if  [  "$NEW_CUSTOM"  ==  "y"  ];  then
    ./Configure -Ui_db -Dprefix=/usr -Dvendorprefix=/usr -Dvendorman1dir=$VENDORMAN1DIR  -Dvendorman3dir=$VENDORMAN3DIR \
                -Dlibperl=libperl.so  &&
    cp config.sh $CONFIG
  else
    if  [  "$THREADED"  ==  "y"  ];  then
      ./Configure  -Dprefix=/usr -d -e                                   \
                   -Ui_db -Dvendorprefix=/usr -Dvendorman1dir=$VENDORMAN1DIR  -Dvendorman3dir=$VENDORMAN3DIR -Dusethreads -Ulocincpth -Dlibperl=libperl.so
    else
      ./Configure  -Dprefix=/usr -d -e                      \
                   -Ui_db -Dvendorprefix=/usr -Dvendorman1dir=$VENDORMAN1DIR  -Dvendorman3dir=$VENDORMAN3DIR -Ulocincpth -Dlibperl=libperl.so
    fi
  fi
fi  &&

make

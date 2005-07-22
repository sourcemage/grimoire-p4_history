if  [  "$ENTRANCE_AUTH"  ==  "pam"  ];  then
  OPTS="--with-auth-mode=pam  \
        $OPTS"
else
  OPTS="--with-auth-mode=shadow  \
        $OPTS"
fi  &&

NOCONFIGURE="no"  ./autogen.sh  &&
default_build

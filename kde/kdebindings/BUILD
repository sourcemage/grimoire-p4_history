if  spell_installed  j2sdk;  then
  WITH_JAVA="--with-java=/usr/lib/j2sdk`installed_version j2sdk`"
  if    [  -d    /usr/lib/j2sdk1.3.1/old.libraries  ]
  then  rm  -rf  /usr/lib/j2sdk1.3.1/old.libraries
  fi
fi

(

  patch  -p0  <  $SCRIPT_DIRECTORY/gtkmozilla.patch
  if  spell_installed  mozilla;  then
    GTKEMBEDMOZ="/usr/include/mozilla/gtkembedmoz/"
    export    CFLAGS="$CFLAGS    -I$GTKEMBEDMOZ"
    export  CXXFLAGS="$CXXFLAGS  -I$GTKEMBEDMOZ"
  fi

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-debug       \
               --enable-final        \
               $WITH_JAVA            \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1

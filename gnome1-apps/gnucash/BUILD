if  [  "$GNUCASH_CVS"  ==  "n"  ];  then
  if    [  "$( installed_version db  |  cut  -c1  )"  ==  "4"  ]
  then  sedit  "s/db-3/db-4/g"  configure
        sedit  "s/db-3/db-4/g"  configure.in
        sedit  "s/@DB_LIBS@/-ldb-4/"  doc/Makefile.in
  else  sedit  "s/@DB_LIBS@/-ldb-3/"  doc/Makefile.in
  fi  &&
  OPTS="${OPTS} --disable-error-on-warning"
else
  OPTS="${OPTS} --disable-deprecated-glib"   &&
  OPTS="${OPTS} --disable-deprecated-gdk"    &&
  OPTS="${OPTS} --disable-deprecated-gtk"    &&
  OPTS="${OPTS} --disable-deprecated-gnome"  
fi  &&

default_build

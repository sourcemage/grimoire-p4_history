(

  unset  LDFLAGS

  if    !  echo  "$CFLAGS"  |  grep  -q -- "-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi

  if    !  echo  "$CXXFLAGS"  |  grep  -q -- "-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi

  ./configure  --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=/usr                  \
               --enable-add-ons=linuxthreads  \
               --with-elf                     \
               --enable-shared                &&
  make                                        &&
  prepare_install                             &&
  make    install                             &&
  unset   LD_PRELOAD                          &&
  if  [  -z  "$GLIBC_LOCALES"  ];  then
    cat  $SCRIPT_DIRECTORY/locales  |
    while  read  LOCALE  DESCRIPTION;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  /usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  else
    for  LOCALE  in  $GLIBC_LOCALES;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  /usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  fi

) > $C_FIFO 2>&1

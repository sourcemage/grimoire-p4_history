(

  if [ "$KMail" = "y" ]
  then
	  echo  "Entering kmail default build opts..."

    OPTS="$OPTS --disable-pinentry-gtk      \
                --disable-pinentry-curses   \
                --disable-fallback-curses   \
								--with-qt-includes=/usr/include/qt \
								--enable-pinentry-qt"
  else

    echo  "No kmail build, asking for opts..."
    if [ "$Qt" == "n" ]
    then
	    OPTS="$OPTS --disable-pinentry-qt"
    fi
      
    if [ "$GTK" = "n" ]
    then
	    OPTS="$OPTS --disable-pinentry-gtk"
    fi
  
  fi

	sedit  "s/pinentry.h/..\/pinentry\/pinentry.h/g"  "qt/main.cpp"

  ./configure --prefix=/usr $OPTS   &&
	make                              &&
	prepare_install                   &&
	make install

) > $C_FIFO 2>&1

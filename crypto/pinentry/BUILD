(

  if [ "$KMail" = "y" ]

    then
      OPTS="$OPTS --disable-pinentry-gtk      \
                  --disable-pinentry-curses   \
                  --disable-fallback-curses"
    else

      if [ "$Qt" = "n" ]
        then
	  OPTS="$OPTS --disable-pinentry-qt"
      fi
      
      if [ "$GTK" = "n" ]
        then
	  OPTS="$OPTS --disable-pinentry-gtk"
      fi
  
  fi

  default_build 

) > $C_FIFO 2>&1

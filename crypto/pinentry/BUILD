(

  # fixes bug in pinentry-qt build files.
        sedit  "s/pinentry.h/..\/pinentry\/pinentry.h/g"  "qt/main.cpp"

  if [ "$Curses" = "n" ]

    then
      OPTS="$OPTS --disable-pinentry-curses   \
                  --disable-fallback-curses"
  fi

  default_build

) > $C_FIFO 2>&1

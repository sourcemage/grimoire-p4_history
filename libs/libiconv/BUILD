(

  export   CFLAGS="`echo $CFLAGS   | sed -e 's|-\<O[[:digit:]]\>||'`" &&
  export CXXFLAGS="`echo $CXXFLAGS | sed -e 's|-\<O[[:digit:]]\>||'`" &&

  default_build

) > $C_FIFO 2>&1

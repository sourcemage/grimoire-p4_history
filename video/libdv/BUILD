(

  # This kludge is required because of a widely known bug in 
  # dvlib, which has been fixed but not released and which
  # causes kino to segfault.  In the next release the need for
  # this should go away, but in the meantime it is necessary
  # to work around, as documented here:
  # http://www.schirmacher.de/cgi-bin/dcforum/dcboard.cgi?az=show_thread&forum=DCForumID1&om=104&omm=3

  case  $MMX  in
    y|Y|j|J)  patch  -p1  <  $SCRIPT_DIRECTORY/libdv-mxx.patch     ;;
    n|N|f|F)  patch  -p1  <  $SCRIPT_DIRECTORY/libdv-no-mxx.patch  ;;
  esac

  export CFLAGS="$CFLAGS -O3"      && # fix compile issues
  ./configure --prefix=/usr  $OPTS &&
  make                             &&
  prepare_install                  &&
  make    install

) > $C_FIFO 2>&1

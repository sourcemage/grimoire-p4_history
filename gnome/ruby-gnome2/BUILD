(

  SUBDIRS="gconf gnome gnomecanvas libart libglade"
  for subdir in $SUBDIRS; do
    cd    $subdir     &&
    ruby  extconf.rb  &&
    make              &&
    cd    ..
  done
  prepare_install  &&
  sedit  's:$(bindir):/usr/bin:'  libglade/Makefile  &&
  for subdir in $SUBDIRS; do
    cd    $subdir  &&
    make  install  &&
    cd    ..
  done

) > $C_FIFO 2>&1

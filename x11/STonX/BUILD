sedit 's/install -c -s stonvga/@if test -f stonvga ; then install -c -s stonvga/' Makefile.in &&
sedit 's/\/stonvga$/\/stonvga ; fi ; \\/' Makefile.in &&
default_build &&

  if [ ! -e /etc/stonx.Keysyms ] ; then
    cp $SOURCE_DIRECTORY/stonx.Keysyms /etc
  fi


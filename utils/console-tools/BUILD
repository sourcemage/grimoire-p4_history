(

  sedit "s/doc//"       Makefile.am  &&
  sedit "s/doc//"       Makefile.in  &&
  sedit "s/examples//"  Makefile.am  &&
  sedit "s/examples//"  Makefile.in  &&

  ./configure  --host=$BUILD         \
               --prefix=/usr         &&
  make                               &&
  prepare_install                    &&
  make    install                    &&


  # Install man pages.

    for  (( COUNT=1 ; COUNT < 9 ; COUNT++ ));  do
      cp  doc/man/*.$COUNT  /usr/man/man$COUNT  2> /dev/null
      true
    done

) > $C_FIFO 2>&1

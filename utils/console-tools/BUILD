(
 
  sedit "s/doc//"       Makefile.am  &&
  sedit "s/doc//"       Makefile.in  &&
  sedit "s/examples//"  Makefile.am  &&
  sedit "s/examples//"  Makefile.in  &&

export CFLAGS="-O1 $CFLAGS"           &&
#for gcc3.3
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
  sedit "s/hack\!\\\n/hack\!\\\n \\\ /g" contrib/codepage.c 
fi  &&
  ./configure  --host=$BUILD         \
               --prefix=/usr         \
	       $OPTS		     &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  # put loadkeys in /bin so the init script can use it
  mv  /usr/bin/loadkeys  /bin        &&


  # Install man pages.

    for  (( COUNT=1 ; COUNT < 9 ; COUNT++ ));  do
      cp  doc/man/*.$COUNT  /usr/man/man$COUNT  2> /dev/null
      true
    done

) > $C_FIFO 2>&1

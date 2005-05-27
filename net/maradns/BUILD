function do_install()
{

  # Copy binaries
  install  -m 750  server/maradns     /usr/sbin
  install  -m 755  tools/askmara      /usr/bin
  install  -m 755  tuzona/getzone     /usr/bin
  install  -m 750  tuzona/zoneserver  /usr/sbin

  # Copy example config files (if they don't exist)
  [  !  -f  /etc/mararc  ]  &&
    install  -m 644  doc/en/examples/example_mararc  /etc/mararc
  [  !  -d  /etc/maradns  ]  &&
    install  -d  /etc/maradns
  [  !  -f  /etc/maradns/db.example.com  ]  &&
    install  -m 644  doc/en/examples/example_csv1  /etc/maradns/db.example.com

  # Copy man pages
  for  i  in  $( seq 1 8 )  ;  do
    install  -m 644  doc/en/man/*.$i  /usr/man/man$i  >  /dev/null  2>&1
  done 
}

(

  ./configure            &&
  make  FLAGS="$CFLAGS"  &&
  prepare_install        &&
  do_install

) > $C_FIFO 2>&1

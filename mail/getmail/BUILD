(

  prepare_install &&

  [ -d /usr/lib/getmail ] || mkdir /usr/lib/getmail/ &&
  cp -a *.py /usr/lib/getmail/ &&
  cp -a getmail /usr/bin/ &&
  cp getmail.1 /usr/man/man1/ &&
  cp getmailrc-example getmailrc   # so gather_docs will pick it up

) > $C_FIFO 2>&1

(

  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install    &&
  (
    useradd -m postfixfilter
    /bin/true
  ) &&
  cp $SCRIPT_DIRECTORY/postfixfilter ~postfixfilter/ &&
  perl -i -pe \
     's/^(smtp\s.*\ssmtpd\s*)$/$1  -o content_filter=postfixfilter:\n/' \
     /etc/postfix/master.cf
  PFF_EXE=~postfixfilter/postfixfilter
  echo >> /etc/postfix/master.cf 'postfixfilter unix - n n - - pipe'
  echo >> /etc/postfix/master.cf \
     "  flags=Rq user=postfixfilter argv=$PFF_EXE "\
     ' -f ${sender} -- ${recipient}'
) > $C_FIFO 2>&1

(
  groupadd  mailman             2>/dev/null
  useradd  -g mailman  mailman  2>/dev/null
  mkdir  -p               /var/spool/mailman
  chown  mailman.mailman  /var/spool/mailman
  chmod  a+rx,g+ws        /var/spool/mailman

  mkdir  -p               /etc/mailman
  chown  mailman.mailman  /etc/mailman
  chmod  a+rx,g+ws        /etc/mailman

  sedit  's: -f $(PACKAGEDIR)/mm_cfg.py: -e $(PACKAGEDIR)/mm_cfg.py:'  \
	 Mailman/Makefile.in

  ./configure  --build=$BUILD                        \
               --prefix=/usr/share/mailman           \
               --with-var-prefix=/var/spool/mailman  \
               --with-cgi-gid=nogroup                \
               $OPTS                                 &&
  make                                               &&
  prepare_install                                    &&
  make    install

) > $C_FIFO 2>&1  &&
(
  /usr/share/mailman/bin/check_perms -f >/dev/null

  if [ ! -f /etc/mailman/mm_cfg.py ];  then
    mv  /usr/share/mailman/Mailman/mm_cfg.py  /etc/mailman
  fi
  ln  -nsf  /etc/mailman/mm_cfg.py  /usr/share/mailman/Mailman
)

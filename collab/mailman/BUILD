# $Id: BUILD,v 1.3 2002/06/03 03:42:23 sergeyli Exp $
(
  groupadd  mailman             2>/dev/null
  useradd  -g mailman  mailman  2>/dev/null

  sedit  's: -f $(PACKAGEDIR)/mm_cfg.py: -e $(PACKAGEDIR)/mm_cfg.py:'  \
	 Mailman/Makefile.in

#	This has to happen before 'configure' otherwise it fails
	mkdir -p              /var/spool/mailman &&
	chown mailman.mailman /var/spool/mailman &&
	chmod a+rx,g+ws       /var/spool/mailman &&

  ./configure  --build=$BUILD                        \
               --prefix=/usr/share/mailman           \
               --with-var-prefix=/var/spool/mailman  \
               --with-cgi-gid=nogroup                \
               $OPTS                                 &&
	make                                             &&
	prepare_install                                  &&

	mkdir -p              /etc/mailman &&
	chown mailman.mailman /etc/mailman &&
	chmod a+rx,g+ws       /etc/mailman &&

	make install

) > $C_FIFO 2>&1  &&
(
	chown -R mailman.mailman /usr/share/mailman
	chmod -R a+rx,g+ws       /usr/share/mailman
	/usr/share/mailman/bin/check_perms -f

	if [ ! -f /etc/mailman/mm_cfg.py ];  then
		mv -f /usr/share/mailman/Mailman/mm_cfg.py /etc/mailman/
	fi
	ln -fns /etc/mailman/mm_cfg.py /usr/share/mailman/Mailman/

	if [ "$MAILMAN_BOOT" == "y" ]; then
		cp -df  misc/mailman      /etc/init.d/

		ln -fns ../init.d/mailman /etc/rc0.d/K12mailman
		ln -fns ../init.d/mailman /etc/rc1.d/K12mailman
		ln -fns ../init.d/mailman /etc/rc2.d/S98mailman
		ln -fns ../init.d/mailman /etc/rc3.d/S98mailman
		ln -fns ../init.d/mailman /etc/rc4.d/S98mailman
		ln -fns ../init.d/mailman /etc/rc5.d/S98mailman
		ln -fns ../init.d/mailman /etc/rc6.d/K12mailman
	fi
)

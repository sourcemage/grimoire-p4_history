# $Id: BUILD,v 1.4 2002/08/10 04:07:47 sergeyli Exp $
(

	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		$OPTS                &&
	make    depend           &&
	make                     &&
	prepare_install          &&
	make    install

) > $C_FIFO 2>&1  &&

(

	cp    -f   /usr/libexec/slapd /usr/sbin/
	mkdir -p   /var/openldap-bdb
	chmod 0700 /var/openldap-bdb

	. $SCRIPT_DIRECTORY/mkconf.sh

  case  $SLAPD_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/slapd.sh  /etc/init.d/

              ln  -nsf  ../init.d/slapd.sh  /etc/rc0.d/K50slapd
              ln  -nsf  ../init.d/slapd.sh  /etc/rc6.d/K50slapd

              ln  -nsf  ../init.d/slapd.sh  /etc/rc1.d/S35slapd
              ln  -nsf  ../init.d/slapd.sh  /etc/rc2.d/S35slapd
              ln  -nsf  ../init.d/slapd.sh  /etc/rc3.d/S35slapd
              ln  -nsf  ../init.d/slapd.sh  /etc/rc4.d/S35slapd
              ln  -nsf  ../init.d/slapd.sh  /etc/rc5.d/S35slapd
              ;;
          *)  ;;
  esac
  
)

# $Id: BUILD,v 1.7 2003/01/04 05:41:22 sergeyli Exp $
(

	./configure                  \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--without-cyrus-sasl \
		--enable-cleartext   \
		--enable-crypt       \
		--enable-rlookups    \
		$OPTS                &&
	make    depend           &&
	make                     &&
	prepare_install          &&
	make    install

) > $C_FIFO 2>&1  &&

(

	cp    -f   /usr/libexec/slapd /usr/sbin/

	. $SCRIPT_DIRECTORY/mkconf.sh

  case  $SLAPD_BOOT  in
    y|Y|j|J)  installscript  slapd.sh
              ;;
          *)  ;;
  esac
  
)

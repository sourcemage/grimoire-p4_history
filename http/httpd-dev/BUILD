# $Id: BUILD,v 1.4 2003/01/07 19:02:09 sergeyli Exp $
(
	pushd modules/experimental                 &&
	patch -p1 < $SCRIPT_DIRECTORY/LDAPv3.patch &&
	popd                                       &&

	./buildconf                                &&
	./configure                                \
		--prefix=/usr           	           \
		--sysconfdir=/etc/httpd                \
		--localstatedir=/var                   \
		--with-mpm=${APACHE_MPM:=prefork}      \
		--enable-layout=GNU                    \
		--enable-so                            \
		--enable-mods-shared=all               \
		--enable-cache                         \
		--enable-case-filter                   \
		--enable-cgi                           \
		--enable-charset-lite                  \
		--enable-deflate                       \
		--enable-disk-cache                    \
		--enable-ext-filter                    \
		--enable-file-cache                    \
		--enable-isapi                         \
		--enable-mem-cache                     \
		--enable-proxy                         \
		$OPTS                                  &&
	make                                       &&
	prepare_install                            &&
	make    install

) > $C_FIFO 2>&1  &&

(

	ln -nsf /usr/sbin/envvars /usr/bin/envvars
	ln -nsf /usr/sbin/httpd   /usr/bin/httpd

	[ -x /etc/init.d/apache.sh ] || cp $SCRIPT_DIRECTORY/apache.sh /etc/init.d/

	case  $APACHE_BOOT  in
	y|Y|j|J)
		ln  -nsf  ../init.d/apache.sh  /etc/rc0.d/K10apache
		ln  -nsf  ../init.d/apache.sh  /etc/rc1.d/K10apache
		ln  -nsf  ../init.d/apache.sh  /etc/rc2.d/K10apache
		ln  -nsf  ../init.d/apache.sh  /etc/rc6.d/K10apache

		ln  -nsf  ../init.d/apache.sh  /etc/rc3.d/S90apache
		ln  -nsf  ../init.d/apache.sh  /etc/rc4.d/S90apache
		ln  -nsf  ../init.d/apache.sh  /etc/rc5.d/S90apache
		;;
	*)  true
		;;
	esac

)

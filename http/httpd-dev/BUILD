# $Id: BUILD,v 1.2 2002/09/06 01:03:41 sergeyli Exp $
(
	message "${MESSAGE_COLOR}Phase 1. Checking out the source${DEFAULT_COLOR}" &&

	export CVSROOT=:pserver:anoncvs@cvs.apache.org:/home/cvspublic &&
	cvs -z 9 ex -f -r HEAD httpd-2.0           &&
	cd httpd-2.0/                              &&
	pushd srclib/                              &&
	cvs -z 9 ex -f -r HEAD apr                 &&
	cvs -z 9 ex -f -r HEAD apr-util            &&
	cd ../modules/experimental/                &&
	patch -p1 < $SCRIPT_DIRECTORY/LDAPv3.patch &&
	popd                                       &&

	message "${MESSAGE_COLOR}Phase 2. Building${DEFAULT_COLOR}" &&

	./buildconf &&
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
	ln -nsf /usr/sbin/httpd /usr/bin/httpd

	cp  $SCRIPT_DIRECTORY/apache.sh     /etc/init.d/

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

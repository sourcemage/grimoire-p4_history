# $Id: BUILD,v 1.3 2002/06/04 11:46:54 sergeyli Exp $
(

	message "${MESSAGE_COLOR}Subversion will build a client to bootstrap to the Subversion project${DEFAULT_COLOR}"
	message "${MESSAGE_COLOR}repository and check out the latest client and Apache 2 module source${DEFAULT_COLOR}"
	message "${MESSAGE_COLOR}code. Then, these will be built and installed.${DEFAULT_COLOR}"

	message "${MESSAGE_COLOR}Checking if mod_dav has been built for ${SPELL_COLOR}apache2${DEFAULT_COLOR}"
	gaze compile apache2 | egrep "/libtool .* mod_dav" > /dev/null 2>&1 &&

#	We don't need Apache stuff here, but "their" neon has to stay
	rm -fr apr/              &&
	rm -fr apr-util/         &&
#	rm -fr neon/             &&

#	Build client to bootstrap to source
	CFLAGS_SAVE=$CFLAGS
	CFLAGS="$CFLAGS -I/usr/include/libxml2/libxml"
	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--disable-shared     \
		$OPTS                &&
	make                     &&
	CFLAGS=$CFLAGS_SAVE

#	Download latest source
	./subversion/clients/cmdline/svn checkout           \
		http://svn.collab.net:80/repos/svn/trunk -d svn &&

#
# -=* ACTUAL BUILD *=-
#

	message "${MESSAGE_COLOR}Starting actual build of the most recent ${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}"
	cd svn                   &&

#	Change required neon version to whatever we have
	sedit "s@^\\(NEON_\\w*\\)=.*\$@\\1=`installed_version neon`@" \
		./build/buildcheck.sh                                     &&

#	Build from checked-out source
	sh ./autogen.sh          &&
	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--with-apr=/usr      \
		--with-apr-util=/usr \
		--with-apxs=apxs     \
		$OPTS                &&
	make                     &&

#	Use this instead of just 'make' for -jN option:
#	make -jN external-all
#	make -jN local-all

#	Install
	prepare_install          &&
	make    install          &&
	make    check

) > $C_FIFO 2>&1 && (

	cat > /etc/httpd/svn.conf.default << __EOF__
#
# See INSTALL and Apache security manuals for more details
#
<Location /svn/repos>
	#
	# This will give anyone unrestricted access to the repository
	#
	DAV svn
	SVNPath /absolute/path/to/repository

	#
	# If you want limited access, read or write, you add these lines:
	#
	AuthType Basic
	AuthName "Subversion repository"
	AuthUserFile /path/to/passwd

	#
	# ...and...
	#
	# a) For a read/write restricted repository:
	#

	Require valid-user

	#
	# b) For a write restricted repository:
	#

	<LimitExcept GET PROPFIND OPTIONS REPORT>
		Require valid-user
	</LimitExcept>

	#
	# c) For seperate restricted read and write access:
	#

	AuthGroupFile /path/to/group
	<LimitExcept GET PROPFIND OPTIONS REPORT>
		Require group svn_committers
	</LimitExcept>
	<Limit GET PROPFIND OPTIONS REPORT>
		Require group svn_committers
		Require group svn_readers
	</Limit>
</Location>
__EOF__

)

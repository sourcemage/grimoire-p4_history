# $Id: BUILD,v 1.6 2002/08/08 02:52:42 sergeyli Exp $
(

	message "${MESSAGE_COLOR}Subversion will build a client to bootstrap to the Subversion project${DEFAULT_COLOR}"
	message "${MESSAGE_COLOR}repository and check out the latest client and Apache 2 module source${DEFAULT_COLOR}"
	message "${MESSAGE_COLOR}code. Then, these will be built and installed.${DEFAULT_COLOR}"

	message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
	httpd -v | grep -q "Apache/2\."                                   &&

	message "${MESSAGE_COLOR}Checking for mod_dav.so Apache module${DEFAULT_COLOR}" &&
	test -f /usr/libexec/mod_dav.so                                                &&

#	Build static client to bootstrap to repository
	./configure                  \
		--build=$BUILD           \
		--prefix=/usr            \
		--sysconfdir=/etc        \
		--localstatedir=/var     \
		--disable-shared         \
		--enable-maintainer-mode &&
	make                         &&

#	Download HEAD revision
	./subversion/clients/cmdline/svn checkout        \
		http://svn.collab.net:80/repos/svn/trunk svn &&

#
# -=* ACTUAL BUILD *=-
#

	message "${MESSAGE_COLOR}Starting actual build of the most recent ${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}"
	cd svn                   &&

#	Change required neon version to whatever we have
#	sedit "s@^\\(NEON_\\w*\\)=.*\$@\\1=`installed_version neon`@" \
#		./build/buildcheck.sh                                     &&

#	Build from checked-out source
#	We no longer have APR, APR-UTIL or neon in this folder, so we use what's on the system
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

	if spell_installed python; then
		make check
	fi                       &&

#	Install
	prepare_install          &&
	make    install

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

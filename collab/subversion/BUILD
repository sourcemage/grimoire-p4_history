# $Id: BUILD,v 1.11 2002/12/11 16:57:15 sergeyli Exp $
(

	SVN_CLIENT=`which svn 2>/dev/null`

	message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
	httpd -v | grep -q "Apache/2\."                                   &&

	message "${MESSAGE_COLOR}Checking for mod_dav.so Apache module${DEFAULT_COLOR}" &&
	[ -e /usr/libexec/mod_dav.so ]                                                  &&

	if [ -z "$SVN_CLIENT" ] || ! $SVN_CLIENT --version >/dev/null 2>&1; then
		message "${MESSAGE_COLOR}Subversion will build a client to bootstrap to the Subversion project${DEFAULT_COLOR}" &&
		message "${MESSAGE_COLOR}repository and check out the latest client and Apache 2 module source${DEFAULT_COLOR}" &&
		message "${MESSAGE_COLOR}code. Then, these will be built and installed.${DEFAULT_COLOR}"                        &&

#		Build static client to bootstrap to repository
		./configure                  \
			--build=$BUILD           \
			--prefix=/usr            \
			--sysconfdir=/etc        \
			--localstatedir=/var     \
			--disable-shared         \
			--enable-maintainer-mode &&
		make                         &&

		SVN_CLIENT=`pwd`/subversion/clients/cmdline/svn
	fi &&

#	Download HEAD revision
	message "${MESSAGE_COLOR}Using client: ${SVN_CLIENT}${DEFAULT_COLOR}" &&
	$SVN_CLIENT --version | head -2 &&
	$SVN_CLIENT --non-interactive --no-auth-cache export http://svn.collab.net/repos/svn/trunk current &&

#
# -=* ACTUAL BUILD *=-
#

	message "${MESSAGE_COLOR}Starting actual build of the most recent ${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}" &&
	cd current &&

#	Build from checked-out source
#	We no longer have APR, APR-UTIL or neon in this folder, so we use what's on the system
	./autogen.sh             &&
	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--with-apr=/usr      \
		--with-apr-util=/usr \
		--with-apxs=apxs     \
		$OPTS                &&
	make             &&
	make swig-py-lib &&

#	Use this instead of just 'make' for -jN option:
#	make -jN external-all
#	make -jN local-all


#	Install
	prepare_install &&
	make    install &&
	make    install-swig-py-lib &&
	make    check

) > $C_FIFO 2>&1 && (

	cat > /etc/httpd/svn.conf.default << __EOF__
#
# See INSTALL and Apache security manuals for more details
#
<Location /svn>
	#
	# This will give anyone unrestricted access to the repositories
	# located at /absolute/path/to/repositories/parent/directory
	#
	DAV svn
	SVNParentPath /absolute/path/to/repositories/parent/directory

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

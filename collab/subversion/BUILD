(

	message "${MESSAGE_COLOR}Checking if mod_dav has been built for ${SPELL_COLOR}apache2${DEFAULT_COLOR}"
	gaze compile apache2 | egrep "/libtool .* mod_dav" > /dev/null 2>&1 &&

#	We don't need this source
	rm -fr apr/              &&
	rm -fr apr-util/         &&
	rm -fr neon/             &&

#	Build client to bootstrap to source
	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		$OPTS                &&

#	Download latest source
	./subversion/clients/cmdline/svn checkout        \
		http://svn.collab.net/repos/svn/trunk -d svn &&

#	Build from this source
	sh ./autogen.sh          &&
	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
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

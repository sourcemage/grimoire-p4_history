# $Id: BUILD,v 1.4 2002/07/29 23:53:53 sergeyli Exp $
#
# this BUILD is also used for Horde applications
# like IMP and Turba
#
	
HORDE_DEST=/usr/share/horde
[ $SPELL != horde ] && HORDE_DEST=$HORDE_DEST/$SPELL

(

	message "${MESSAGE_COLOR}Checking modules compiled into ${SPELL_COLOR}php${DEFAULT_COLOR}"
	gaze compile php | egrep "/libtool .*/ext/gettext/" > /dev/null 2>&1 &&
	gaze compile php | egrep "/libtool .*/ext/imap/"    > /dev/null 2>&1 &&
	gaze compile php | egrep "/libtool .*/ext/xml/"     > /dev/null 2>&1 &&

	prepare_install                                                      &&

	# force copy everything because no configuration files are overwritten
	# all Horde packages come with config/*.conf.dist files, which better
	# be updated by force copy anyway
	mkdir -p    $HORDE_DEST                                              &&
	cp    -R ./ $HORDE_DEST/

) > $C_FIFO 2>&1 && (

	cd $HORDE_DEST/

	SLAPD_CONF=/etc/openldap/slapd.conf
	SLAPD_SCHEMA=/etc/openldap/schema

	if [ $SPELL == horde ] && spell_installed openldap && [ -r $SLAPD_CONF ] && [ -d $SLAPD_SCHEMA ]; then
		SUFFIX=`gawk '/^suffix\W+/ { match($0, /^suffix\W+"?([^"]+)"?\W*$/, a); print a[1]; nextfile; }' $SLAPD_CONF`
		message "${MESSAGE_COLOR}Found LDAP database suffix:${DEFAULT_COLOR} $SUFFIX"

		cp -f ./scripts/ldap/*.schema $SLAPD_SCHEMA/

		if ! grep "horde.schema" $SLAPD_CONF > /dev/null 2>&1; then
			T=/tmp/${SLAPD_CONF//\//_}.$$
			gawk -f $SCRIPT_DIRECTORY/addschema.gawk $SLAPD_CONF > $T
			#
			# I don't want to lose permissions so I'm doing cat+rm instead of mv
			#
			cat $T > $SLAPD_CONF
			rm  $T
			message "${MESSAGE_COLOR}Horde schema added to ${SLAPD_CONF}${DEFAULT_COLOR}"

			[ -x /etc/init.d/slapd.sh ] && /etc/init.d/slapd.sh restart
		fi
	fi

	cd $HORDE_DEST/config/
	for f in `ls -1 *.dist`; do
		[ -e ${f%.dist} ] || cp $f ${f%.dist}
	done
	chmod -w *.dist

)

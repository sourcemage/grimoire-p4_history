#
# this BUILD is also used for Horde applications
# like IMP and Turba
#
	
HORDE_DEST=/usr/share/horde
[ $SPELL != horde ] && HORDE_DEST=$HORDE_DEST/$SPELL

function update_openldap() {
	HORDE_MARK="#### Horde Application Framework ####"

	grep "$HORDE_MARK" /etc/openldap/slapd.conf > /dev/null 2>&1                                              && return
	query "${MESSAGE_COLOR}Would you like to add IMP information to OpenLDAP's slapd.conf${DEFAULT_COLOR}?" y || return

	/etc/init.d/slapd.sh stop

	cat >> /etc/openldap/slapd.conf << __EOF__

$HORDE_MARK

include		/etc/openldap/schema/gollem.schema
include		/etc/openldap/schema/horde.schema
include		/etc/openldap/schema/imp.schema
include		/etc/openldap/schema/kronolith.schema
include		/etc/openldap/schema/nag.schema
include		/etc/openldap/schema/turba.schema

access to filter=(objectclass=gollemPrefs)
	by self write
	by *    none
access to filter=(objectclass=hordePrefs)
	by self write
	by *    none
access to filter=(objectclass=impPrefs)
	by self write
	by *    none
access to filter=(objectclass=kronolithPrefs)
	by self write
	by *    none
access to filter=(objectclass=nagPrefs)
	by self write
	by *    none
access to filter=(objectclass=turbaPrefs)
	by self write
	by *    none

$HORDE_MARK
__EOF__

	/etc/init.d/slapd.sh start
}

(

	message "${MESSAGE_COLOR}Checking modules compiled into ${SPELL_COLOR}php${DEFAULT_COLOR}"
	gaze compile php | egrep "/libtool .*/ext/gettext/" > /dev/null 2>&1 &&
	gaze compile php | egrep "/libtool .*/ext/imap/"    > /dev/null 2>&1 &&
	gaze compile php | egrep "/libtool .*/ext/xml/"     > /dev/null 2>&1 &&

	prepare_install

) > $C_FIFO 2>&1 && (

	gather_docs
	rm -fr ./README* ./docs/

	# force copy everything because no configuration files are overwritten
	# all Horde packages come with config/*.conf.dist files, which better
	# be updated by force copy anyway

	mkdir -p     $HORDE_DEST
	cp    -fR ./ $HORDE_DEST/
	cd           $HORDE_DEST/

	if [ $SPELL == horde ] && spell_installed openldap; then
		message "${MESSAGE_COLOR}Adjusting Horde configuration for LDAP support${DEFAULT_COLOR}"
		[ -d /etc/openldap/schema/ ] && cp -f ./scripts/ldap/*.schema /etc/openldap/schema/
		patch -p1 < $SCRIPT_DIRECTORY/ldap.patch > /dev/null
		update_openldap
	fi

	cd $HORDE_DEST/config/
	for f in `ls -1 *.dist`; do
		[ -e ${f%.dist} ] || cp $f ${f%.dist}
	done
	chmod -w *.dist

)

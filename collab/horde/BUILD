# $Id: BUILD,v 1.6 2002/11/14 21:30:35 sergeyli Exp $
#
# this BUILD is also used for Horde applications
# like IMP and Turba
#
	
HORDE_DEST=/usr/share/horde
[ $SPELL != horde ] && HORDE_DEST=$HORDE_DEST/$SPELL

PHP_MODULES=`php -m`

(

  message "${MESSAGE_COLOR}Checking for necessary modules in ${SPELL_COLOR}php${DEFAULT_COLOR}" &&
  echo "$PHP_MODULES" | grep -q gettext &&
  echo "$PHP_MODULES" | grep -q imap &&
  echo "$PHP_MODULES" | grep -q xml &&

  prepare_install &&

  # force copy everything because no configuration files are overwritten
  # all Horde packages come with config/*.conf.dist files, which better
  # be updated by force copy anyway
  mkdir -p     $HORDE_DEST &&
  cp    -fR ./ $HORDE_DEST/

) > $C_FIFO 2>&1 && (

  cd $HORDE_DEST/

  SLAPD_CONF=/etc/openldap/slapd.conf
  SLAPD_SCHEMA=/etc/openldap/schema

  if [ $SPELL == horde ] && spell_installed openldap && [ -r $SLAPD_CONF ] && [ -d $SLAPD_SCHEMA ]; then
    SUFFIX=`gawk '/^suffix\W+/ { match($0, /^suffix\W+"?([^"]+)"?\W*$/, a); print a[1]; nextfile; }' $SLAPD_CONF`
    message "${MESSAGE_COLOR}Found LDAP database suffix:${DEFAULT_COLOR} $SUFFIX"

    cp -f ./scripts/ldap/*.schema $SLAPD_SCHEMA/

    if ! grep -q "horde.schema" $SLAPD_CONF; then
      CONTENTS=`gawk -f $SCRIPT_DIRECTORY/addschema.gawk $SLAPD_CONF`
      #
      # I don't want to lose permissions so I'm doing cat+rm instead of mv
      #
      echo "$CONTENTS" > $SLAPD_CONF
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

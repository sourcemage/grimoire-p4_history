# $Id: BUILD,v 1.7 2003/01/08 18:35:55 sergeyli Exp $
#
# this BUILD is also used for Horde applications
# like IMP and Turba
#
	
HORDE_DIR=/usr/share/horde
HORDE_CONFIG_DIR=/etc/horde
if [ "$SPELL" != "horde" ]; then
  HORDE_DIR=$HORDE_DIR/$SPELL
  HORDE_CONFIG_DIR=$HORDE_CONFIG_DIR/$SPELL
fi

PHP_MODULES=$(php -m)

(

  message "${MESSAGE_COLOR}Checking for necessary modules in ${SPELL_COLOR}php${DEFAULT_COLOR}" &&
  echo "$PHP_MODULES" | grep -q gettext &&
  echo "$PHP_MODULES" | grep -q imap &&
  echo "$PHP_MODULES" | grep -q xml &&

  if [ -r $SPELL-config.patch ]; then
    echo "Applying a patch necessary to relocate $HORDE_DIR/config directory to $HORDE_CONFIG_DIR" &&
    patch -p1 < $SPELL-config.patch
  fi &&

  prepare_install &&

  # force copy everything because no configuration files are overwritten
  # all Horde packages come with config/*.conf.dist files, which better
  # be updated by force copy anyway
  mkdir -p     $HORDE_DIR  &&
  cp    -fR ./ $HORDE_DIR/ &&

  # deal with configuration files and directory
  if [ -d $HORDE_DIR/config ]; then
    echo "Updating configuration in $HORDE_CONFIG_DIR..."                        &&
    mkdir -p --mode=755 $HORDE_CONFIG_DIR                                        &&
    echo "Moving configuration to $HORDE_CONFIG_DIR from $HORDE_DIR/config..."   &&
    mv     $HORDE_DIR/config/* $HORDE_CONFIG_DIR/                                &&
    rm -fr $HORDE_DIR/config/                                                    &&
    echo "Making a symbolic link to $HORDE_CONFIG_DIR from $HORDE_DIR/config..." &&
    ln -fns $HORDE_CONFIG_DIR $HORDE_DIR/config
  fi

) > $C_FIFO 2>&1 && (

  cd $HORDE_DIR/

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

      # only restart if the configuration is correct
      [ -x /etc/init.d/slapd.sh ] && slapd -t && /etc/init.d/slapd.sh restart
    fi
  fi

  # this will be a symlink to HORDE_CONFIG_DIR
  cd $HORDE_DIR/config
  for f in $(ls -1 *.dist); do
    [ -e ${f%.dist} ] || cp $f ${f%.dist}
  done
  chmod -w *.dist

)

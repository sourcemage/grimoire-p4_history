# -*- mode: shell-script; -*-
# This BUILD is also used for Horde applications like IMP and Turba
	
HORDE_DIR=/usr/share/horde
HORDE_CONFIG_DIR=/etc/horde
HORDE_PREFIX=''
if [ "$SPELL" != 'horde' ]; then
  HORDE_DIR="$HORDE_DIR/$SPELL"
  HORDE_CONFIG_DIR="$HORDE_CONFIG_DIR/$SPELL"
  HORDE_PREFIX="/$SPELL"
fi

PHP_MODULES=$(php -m 2>/dev/null)

(

  message "${MESSAGE_COLOR}Checking for necessary modules in ${SPELL_COLOR}php${DEFAULT_COLOR}" &&
  echo "$PHP_MODULES" | grep -q gettext &&
  echo "$PHP_MODULES" | grep -q imap &&
  echo "$PHP_MODULES" | grep -q xml &&

  # kill remnants of CVS, if any
  rm -fr $(find ./ -type d -and -name CVS)        &&
  rm -fr $(find ./ -type f -and -name .cvsignore) &&

  # replace all occurrences of
  #   dirname(__FILE__) . '/..
  # to references to HORDE_BASE
  message "${MESSAGE_COLOR}Applying changes necessary to relocate $HORDE_DIR/config directory to $HORDE_CONFIG_DIR${DEFAULT_COLOR}" &&
  cd config &&
  for f in *.php*; do
    sedit "s|dirname(__FILE__) \. '\/\.\.|HORDE_BASE . '$HORDE_PREFIX|" $f
  done &&
  cd .. &&

  prepare_install &&

  # deal with configuration files and directory
  if [ -d "./config" ]; then
    # Configuration scripts include definition of multiple `fileroot' fields, and
    # we need to make sure that these definitions are not based on __FILE__ variable value
    # because in such a case the placement of scripts in /etc/... won't work
    message "${MESSAGE_COLOR}Checking that configuration modules do not reference __FILE__...${DEFAULT_COLOR}" &&
    ! grep 'fileroot' ./config/* | grep -q '__FILE__' &&

    message "${MESSAGE_COLOR}Moving configuration to '$HORDE_CONFIG_DIR'...${DEFAULT_COLOR}" &&
    mkdir -p "$HORDE_CONFIG_DIR"  &&
    # no configuration files are overwritten, all Horde packages come with
    # config/*.conf.dist files, which have to be updated
    mv -f  ./config/* "$HORDE_CONFIG_DIR/" &&
    rm -fr ./config
  fi &&

  mkdir -p "$HORDE_DIR"  &&
  # we create a link to a full-path target, so no relative path dangers here
  ln -fns "$HORDE_CONFIG_DIR" "$HORDE_DIR/config" &&
  message "${MESSAGE_COLOR}Copying files to '$HORDE_DIR'...${DEFAULT_COLOR}" &&
  cp -fR ./ "$HORDE_DIR/"

) >$C_FIFO 2>&1 && (

  cd "$HORDE_DIR/"

  SLAPD_CONF=/etc/openldap/slapd.conf
  SLAPD_SCHEMA=/etc/openldap/schema

  if [ "$SPELL" == 'horde' ] && spell_installed openldap && [ -r "$SLAPD_CONF" ] && [ -d "$SLAPD_SCHEMA" ]; then
    SUFFIX=$(gawk '/^suffix\W+/ { match($0, /^suffix\W+"?([^"]+)"?\W*$/, a); print a[1]; nextfile; }' "$SLAPD_CONF")
    message "${MESSAGE_COLOR}Found LDAP database suffix:${DEFAULT_COLOR} '$SUFFIX'..."

    cp -f ./scripts/ldap/*.schema "$SLAPD_SCHEMA/"

    if ! grep -q "horde.schema" "$SLAPD_CONF"; then
      CONTENTS=$(gawk -f "$SCRIPT_DIRECTORY/addschema.gawk" "$SLAPD_CONF")
      # we don't want to lose permissions so we're doing cat+rm instead of mv
      echo "$CONTENTS" > $SLAPD_CONF
      message "${MESSAGE_COLOR}Horde schema added to $SLAPD_CONF...${DEFAULT_COLOR}"

      # only restart if the configuration is correct
      [ -x /etc/init.d/slapd ] && slapd -t && /etc/init.d/slapd restart
    fi
  fi

  # this will be a symlink to HORDE_CONFIG_DIR
  cd "$HORDE_CONFIG_DIR"
  for f in $(ls -1 *.dist); do
    [ -e "${f%.dist}" ] || cp "$f" "${f%.dist}"
  done
  chmod -w *.dist

)

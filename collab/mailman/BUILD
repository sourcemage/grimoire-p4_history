# $Id: BUILD,v 1.5 2002/10/01 16:34:12 sergeyli Exp $

local SPOOL=/var/spool/mailman
local CONF=/etc/mailman
local PREFIX=/usr/share/mailman

function mk_mailman_dir() {
  local DIRECTORY=$1
  local TAG=${2:-unclassified}

  message "${MESSAGE_COLOR}Preparing ${TAG} directory ${DIRECTORY}${DEFAULT_COLOR}"
  if [ ! -d $DIRECTORY ]; then mkdir -p $DIRECTORY; fi &&
  chown -R mailman.mailman $DIRECTORY &&
  chmod -R a+rx,g+ws $DIRECTORY
}

(
  groupadd   mailman           2>/dev/null
  useradd -g mailman  mailman  2>/dev/null

  sedit  's: -f $(PACKAGEDIR)/mm_cfg.py: -e $(PACKAGEDIR)/mm_cfg.py:' Mailman/Makefile.in &&

  # This has to happen before 'configure' otherwise it fails
  mk_mailman_dir $SPOOL 'spool' &&

  patch -p2 < $SPELL_DIRECTORY/mailman.driver.security.patch
  ./configure  --build=$BUILD \
               --prefix=$PREFIX \
               --with-var-prefix=$SPOOL \
               --with-cgi-gid=nogroup \
               $OPTS &&
  make &&
  prepare_install &&

  make install &&

  mk_mailman_dir $PREFIX 'program' &&
  mk_mailman_dir $CONF 'configuration' &&
  if [ ! -f $CONF/mm_cfg.py ];  then
    mv -f $PREFIX/Mailman/mm_cfg.py $CONF/
  fi &&
  ln -fns $CONF/mm_cfg.py $PREFIX/Mailman/

) > $C_FIFO 2>&1 && (
 
       $PREFIX/bin/check_perms -f

)

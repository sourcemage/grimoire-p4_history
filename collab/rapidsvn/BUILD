# $Id: BUILD,v 1.1 2002/10/25 18:57:12 sergeyli Exp $
(

#  message "${MESSAGE_COLOR}Downloading the up-to-date source...${DEFAULT_COLOR}"
#  svn export http://svn.collab.net/repos/svn/clients/rapidsvn/trunk . &&

  patch -p1 < $SCRIPT_DIRECTORY/$SPELL.patch &&

  ./autogen.sh &&
  ./configure                       \
    --build=$BUILD                  \
    --prefix=/usr                   \
    --sysconfdir=/etc               \
    --localstatedir=/var            \
    --with-svn-config=$(which svn-config) \
    --with-svn-include=/usr/include \
    --with-wx-config=$(which wx-config) \
    $OPTS                           &&
  make       &&
  make check &&

  prepare_install &&
  cp -f rapidsvn /usr/bin

) > $C_FIFO 2>&1

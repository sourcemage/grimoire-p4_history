# $Id: BUILD,v 1.1 2002/10/25 18:57:12 sergeyli Exp $
(

#  message "${MESSAGE_COLOR}Downloading the up-to-date source...${DEFAULT_COLOR}"
#  svn export http://svn.collab.net/repos/svn/clients/rapidsvn/trunk . &&

  ./autogen.sh &&
  ./configure                       \
    --build=$BUILD                  \
    --prefix=/usr                   \
    --sysconfdir=/etc               \
    --localstatedir=/var            \
    --with-svn-include=/usr/include \
    --with-svn-lib=/usr/lib         \
    $OPTS                           &&
  make       &&
  make check &&

  prepare_install &&
  cp -f rapidsvn /usr/bin

) > $C_FIFO 2>&1

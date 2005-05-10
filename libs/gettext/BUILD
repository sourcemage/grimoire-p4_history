# disable emacs, bug #8592
sedit  's/EMACS = @EMACS@/EMACS = no/'  gettext-tools/misc/Makefile.in  &&

export CC=gcc                                           &&

./configure  --build=$BUILD                             \
              --host=$HOST                              \
            --prefix=${INSTALL_ROOT}/usr                \
        --sysconfdir=${INSTALL_ROOT}/etc                \
           --infodir=${INSTALL_ROOT}/usr/share/info     \
            --mandir=${INSTALL_ROOT}/usr/share/man      \
             --with-included-gettext                    \
        --includedir=${INSTALL_ROOT}/usr/local/include  \
             $OPTS                                      &&
make                                                    &&

if  [  "$GETTEXT_TETEX"  ==  "y"  ];  then
  cd  gettext-tools/doc  &&
  make  dvi              &&
  make  ps               &&
  make  pdf              &&
  cd  -
fi  &&

#
# Remove libintl.h from old log files
#
(  sedit  '/libintl.h/d'  $INSTALL_LOGS/gettext*            ||  true  )  &&
(  sedit  '/libintl.h/d'  /var/log/sorcery/md5sum/gettext*  ||  true  )

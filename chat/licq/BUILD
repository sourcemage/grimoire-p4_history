(

  autoconf			     &&

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  &&
  make                               &&

##  cd  $SOURCE_DIRECTORY/plugins/console-$VERSION   &&
  cd  $SOURCE_DIRECTORY/plugins/console            &&
  autoconf					   &&
  ./configure  --prefix=/usr                       \
               --sysconfdir=/etc                   \
               --localstatedir=/var                &&
  make                                             &&

  if  spell_installed  qt-x11;  then
#    cd  $SOURCE_DIRECTORY/plugins/qt-gui-$VERSION  &&
    cd  $SOURCE_DIRECTORY/plugins/qt-gui           &&
#    autoconf					   &&
    ./configure  --prefix=/usr                     \
                 --sysconfdir=/etc                 \
                 --localstatedir=/var              \
                 $OPTS                             &&
    make
  fi                                              &&

  if  spell_installed  gtk+;  then
  cd $SOURCE_DIRECTORY/plugins/jons-gtk-gui        &&
  ./configure  --prefix=/usr                       \
               --sysconfdir=/etc                   \
               --localstatedir=/var                \
               $OPTS                               &&
    make
  fi                                              &&

  prepare_install                                 &&
  cd  $SOURCE_DIRECTORY                           &&
  make    install                                 &&
  cd  $SOURCE_DIRECTORY/plugins/console           &&
  make    install                                 &&
  if  spell_installed  gtk+;  then
    cd  $SOURCE_DIRECTORY/plugins/jons-gtk-gui    &&
    make    install                               
  fi
  if  spell_installed  qt-x11;  then
#    cd  $SOURCE_DIRECTORY/plugins/qt-gui-$VERSION &&
    cd  $SOURCE_DIRECTORY/plugins/qt-gui          &&
    make    install				  &&
    if spell_installed kdelibs; then
      if [ -h /usr/lib/licq/licq_qt-gui.so ] ; then
        rm -f /usr/lib/licq/licq_qt-gui.so
      fi
      ln -s /usr/lib/licq/licq_kde-gui.so /usr/lib/licq/licq_qt-gui.so
    fi
  fi						  

) > $C_FIFO 2>&1

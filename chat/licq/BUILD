(

  case  $VERSION  in
    1.0.4)  patch  -p1  <  $SCRIPT_DIRECTORY/licq-1.0.4.patch  ;;
  esac


  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  &&
  make                               &&

  cd  $SOURCE_DIRECTORY/plugins/console-$VERSION   &&
  ./configure  --prefix=/usr                       \
               --sysconfdir=/etc                   \
               --localstatedir=/var                &&
  make                                             &&

  if  spell_installed  qt-x11;  then

    cd  $SOURCE_DIRECTORY/plugins/qt-gui-$VERSION  &&
    ./configure  --prefix=/usr                     \
                 --sysconfdir=/etc                 \
                 --localstatedir=/var              \
                 $OPTS                             &&
    make

  fi                                              &&
  prepare_install                                 &&
  cd  $SOURCE_DIRECTORY                           &&
  make    install                                  &&
  cd  $SOURCE_DIRECTORY/plugins/console-$VERSION  &&
  make    install                                 &&
  if  spell_installed  qt-x11;  then
    cd  $SOURCE_DIRECTORY/plugins/qt-gui-$VERSION
    make    install
  fi

) > $C_FIFO 2>&1

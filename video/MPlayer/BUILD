(

  case  $GUI  in
    y|Y|j|J)  OPTS="$OPTS  --enable-gui"  ;;
  esac

  ./configure  --prefix=/usr  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install  prefix=/usr

  mkdir -p           /usr/doc/MPlayer
  cp -r etc/*        /usr/doc/MPlayer
  mkdir -p           /usr/share/mplayer
  cp etc/codecs.conf /usr/share/mplayer

  if [ ! -f /etc/mplayer.conf ]; then
    sedit "s/include =/# include =/" etc/example.conf
    sedit "s/# vo=/vo=/"             etc/example.conf
    sedit "s/# ao=/ao=/"             etc/example.conf
    cp    etc/example.conf           /etc/mplayer.conf
  fi

  mkdir -p /usr/share/mplayer/fonts
  unzip -q -d /usr/share/mplayer/fonts $SOURCE_CACHE/$SOURCE2 &&
  unzip -q -d /usr/share/mplayer/fonts $SOURCE_CACHE/$SOURCE3 &&
  rm -r /usr/share/mplayer/font                               &&
  ln -s /usr/share/mplayer/fonts/iso-8859-1/arial-18/ /usr/share/mplayer/font
  
  if [ "$GUI" == "y" ]; then
    mkdir -p /usr/share/mplayer/Skin
    bzip2 -cd $SOURCE_CACHE/$SOURCE4 | tar -C /usr/share/mplayer/Skin -xf -
  fi
  
) > $C_FIFO 2>&1

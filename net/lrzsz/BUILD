FIXES="s:extern char \*strstr();://extern char \*strstr();:g"

sedit  "$FIXES"  src/lrz.c
sedit  "$FIXES"  src/lsz.c

case $LRZSZ_STRIP_L  in
  y|Y|j|J)  LRZSZ_TRANSFORM="--program-transform-name=s/l//"
            ;;
        *)  LRZSZ_TRANSFORM=""
            ;;
esac


(

  ./configure  --build=$BUILD        \
               $LRZSZ_TRANSFORM      \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  case $LRZSZ_STRIP_L  in
    y|Y|j|J) case $LRZSZ_LINK_L  in
               y|Y|j|J)  (
                           cd /usr/bin  &&
                           ln -vs sz lsz &&
                           ln -vs rz lrz
                         )
                         ;;
                     *)  ;;
              esac
              ;;
          *)  ;;
  esac

) > $C_FIFO 2>&1



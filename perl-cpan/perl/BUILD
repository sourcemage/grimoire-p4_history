CONFIG="$DEPENDS_CONFIG/perl_config.sh"

case  $CUSTOM  in
  y|Y|j|J)  sound  REPORT
            if [ -f $CONFIG ]; then
              cp $CONFIG ./config.sh  &&
              ./Configure -S          &&
              make depend
            else
              ./Configure  -Dprefix=/usr  -Dusethreads -Ulocincpth
            fi
            cp config.sh $CONFIG  ;;
        *)  true  ;;
esac

(

  case  $CUSTOM  in
    y|Y|j|J)  true  ;;
          *)  ./Configure  -Dprefix=/usr -d -e      \
                           -Dusethreads -Ulocincpth ;;
  esac             &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

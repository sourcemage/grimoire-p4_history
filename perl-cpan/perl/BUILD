case  $CUSTOM  in
  y|Y|j|J)  sound  REPORT
            ./Configure  -Dprefix=/usr  ;;
        *)  true  ;;
esac

(

  case  $CUSTOM  in
    y|Y|j|J)  true  ;;
          *)  ./Configure  -Dprefix=/usr -d -e  \
                           -Dusethreads         ;;
  esac             &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

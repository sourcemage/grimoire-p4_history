(

  make   &&

  case  ${FLOPPY}  in
    y|Y)  make  install
          ;;
      *)  true
          ;;
  esac   &&

  case  ${IMAGE}  in
    y|Y)  message  "${MESSAGE_COLOR}You will need to add /boot/memtest"  \
                   "to your boot loader.${DEFAULT_MESSAGE}"
          install  -m  644  memtest.bin  /boot/memtest
          ;;
      *)  true
          ;;
  esac

)  >  $C_FIFO  2>&1

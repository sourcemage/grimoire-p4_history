(

  create_account  phone

  cp  policy.h-dist  policy.h
  patch  <  $SCRIPT_DIRECTORY/Makefile.patch

  case  $LOGIN_PATCH  in
    y|Y|j|J)
      patch  <  $SCRIPT_DIRECTORY/policy.h.misc.patch
      ;;
    *)
      true
      ;;
  esac             &&

  case  $NEWFAX_PATCH  in
    y|Y|j|J)
      patch  <  $SCRIPT_DIRECTORY/policy.h.new_fax.patch
      ;;
    *)
      true
      ;;
  esac             &&

  make             &&
  prepare_install  &&
  make    install  &&

  case  $MGETTY_BOOT  in
    y|Y|j|J)
      echo  >>  /etc/inittab
      echo  $INITTAB_STRING  >>  /etc/inittab
      ;;
    *)
      true
      ;;
  esac

) > $C_FIFO 2>&1

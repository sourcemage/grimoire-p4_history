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

  sedit  "s:FAX_OUT_USER=fax:FAX_OUT_USER=phone:g"  Makefile

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

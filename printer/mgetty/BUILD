(

  create_account  phone

  cp  policy.h-dist  policy.h                                 &&
  patch  <  $SCRIPT_DIRECTORY/Makefile.patch                  &&

  case  $LOGIN_PATCH  in
    y|Y|j|J)
      patch  <  $SCRIPT_DIRECTORY/policy.h.misc.patch
      ;;
    *)
      true
      ;;
  esac                                                        &&

  case  $NEWFAX_PATCH  in
    y|Y|j|J)
      patch  <  $SCRIPT_DIRECTORY/policy.h.new_fax.patch
      ;;
    *)
      true
      ;;
  esac                                                        &&

  sedit  "s:FAX_OUT_USER=fax:FAX_OUT_USER=phone:g"  Makefile  &&

  make                                                        &&
  if  [  "${INCLUDE_VGETTY}"  ==  "y"  ];  then
    make  vgetty
  fi                                                          &&
  prepare_install                                             &&
  make    install                                             &&
  if  [  "${INCLUDE_VGETTY}"  ==  "y"  ];  then
    make  vgetty-install
  fi                                                          &&

  if  [  -e  /var/spool/fax  ];  then
    chown  -R  phone.phone /var/spool/fax                     &&
    chmod  -R  770         /var/spool/fax
  fi

) > $C_FIFO 2>&1

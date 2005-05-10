(

  LDFLAGS=${LDFLAGS//-z combreloc/}                                      &&

  case  $IPV6  in
    n|N)  IPV6="--without-ipv6"
          ;;
    *)    message "${MESSAGE_COLOR}Using IPV6... ${DEFAULT_COLOR}"       &&
          IPV6="--with-ipv6"
          ;;
  esac                                                                   &&

  ./configure  --prefix=${INSTALL_ROOT}/usr                              \
               --localstatedir=${INSTALL_ROOT}/var                       \
               --sysconfdir=${INSTALL_ROOT}/etc/$SPELL                   \
               --datadir=${INSTALL_ROOT}/usr/share/$SPELL                \
               --libexecdir=${INSTALL_ROOT}/usr/libexec/$SPELL           \
               --disable-root-check                                      \
               --enable-workarounds-for-imap-client-bugs                 \
               $OPTS                                                     \
               $IPV6                                                     \
               $PAM                                                      &&

  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.log     &&
  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.status  &&
  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/Makefile       &&

  make                                                                   &&

  prepare_install                                                        &&

  mkdir   -p  ${INSTALL_ROOT}/usr/share/$SPELL                           &&

  make    install                                                        &&
  make    install-configure                                              &&

  mkimapdcert                                                            &&
  mkpop3dcert                                                            &&

  if ( spell_ok linux-pam ) && ( "$AUTHPAM" != "" );  then
    message  "${MESSAGE_COLOR}Setting up /etc/pam.d..."                  &&
    cp  -v  $SCRIPT_DIRECTORY/pam.d/* ${INSTALL_ROOT}/etc/pam.d          &&
    message  " ${DEFAULT_COLOR}"
  fi                                                                     &&

  chmod 555 *.rc

) > $C_FIFO 2>&1

create_account  courier                                       &&

case  "${COURIER_SSLWEBMAIL}"  in
    yes)                   OPTS="$OPTS  --enable-https"
                           ;;
    login_only)            OPTS="$OPTS  --enable-https=login"
                           ;;
    user_decides_via_url)  OPTS="$OPTS  --enable-https=auto"
                           ;;
    deafult)               OPTS="$OPTS  --enable-https=login  \
                                        --enable-https=auto"
                           ;;
    no)                    OPTS="$OPTS  --disable-https"
                           ;;
esac                                                          &&

if  [  "${COURIER_IMAPBUGS}"    ==  "--enable-workarounds-for-imap-client-bugs"  ]   ||
       "${COURIER_TRASHQUOTA}"  ==  "--with-trashquota"                          ];  then
    ##  Add the options that do not break 'make check':
    OPTS="${OPTS}                                             \
          ${COURIER_OPTS}                                     \
             --sysconfdir=${INSTALL_ROOT}/etc/courier         \
          --localstatedir=${INSTALL_ROOT}/var/courier         \
          --with-shellpath=${PATH}                            \
          --disable-root-check                                \
          --with-mailuser=courier                             \
          --with-mailgroup=courier"                           &&
    default_build                                             &&
    make    check                                             &&
    ##  Add the options that break 'make check':
    OPTS="${OPTS}                                             \
          ${COURIER_IMAPBUGS}                                 \
          ${COURIER_TRASHQUOTA}"                              &&
    default_build
else
    OPTS="${OPTS}                                             \
          ${COURIER_OPTS}                                     \
             --sysconfdir=${INSTALL_ROOT}/etc/courier         \
          --localstatedir=${INSTALL_ROOT}/var/courier         \
          --with-shellpath=${PATH}                            \
          --disable-root-check                                \
          --with-mailuser=courier                             \
          --with-mailgroup=courier                            \
          ${COURIER_IMAPBUGS}                                 \
          ${COURIER_TRASHQUOTA}"                              &&
    default_build                                             &&
    make    check
fi


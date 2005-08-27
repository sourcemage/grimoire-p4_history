if  [  "${COURIER_IMAPBUGS}"    ==  "--enable-workarounds-for-imap-client-bugs"  ]  ||
       "${COURIER_TRASHQUOTA}"  ==  "--with-trashquota"                          ]
then
    ##  Add configure options that do not break 'make check':
    OPTS="$OPTS                                               \
             --sysconfdir=${INSTALL_ROOT}/etc/${SPELL}        \
          --localstatedir=${INSTALL_ROOT}/var/${SPELL}        \
                --datadir=${INSTALL_ROOT}/usr/share/$SPELL    \
             --libexecdir=${INSTALL_ROOT}/usr/libexec/$SPELL  \
          --disable-root-check                                \
          $CIMAP_IPV6                                         \
          $CIMAP_UNICODE                                      \
          $CIMAP_IMAPBUGS                                     \
          $CIMAP_DIRSYNC                                      \
          $CIMAP_SMAP"                                        &&
    default_build                                             &&
    make  check                                               &&
    ##  Add configure options that do break 'make check':
    OPTS="$OPTS                                               \
          $CIMAP_IMAPBUGS                                     \
          $CIMAP_TRASHQUOTA"                                  &&
    default_build
else
    OPTS="$OPTS                                               \
             --sysconfdir=${INSTALL_ROOT}/etc/${SPELL}        \
          --localstatedir=${INSTALL_ROOT}/var/${SPELL}        \
                --datadir=${INSTALL_ROOT}/usr/share/$SPELL    \
             --libexecdir=${INSTALL_ROOT}/usr/libexec/$SPELL  \
          --disable-root-check                                \
          $CIMAP_IMAPBUGS                                     \
          $CIMAP_TRASHQUOTA                                   \
          $CIMAP_IPV6                                         \
          $CIMAP_UNICODE                                      \
          $CIMAP_IMAPBUGS                                     \
          $CIMAP_DIRSYNC                                      \
          $CIMAP_SMAP"                                        &&
    default_build                                             &&
    make  check
fi


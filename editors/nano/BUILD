  OPTS="$OPTS --build=${BUILD} ${NANO_OPTS}"
  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST}"
  if [[ "$SPELL_HIGHLIGHT" == "y" ]]; then
    cd  doc                                              &&
    patch -p0 < ${SCRIPT_DIRECTORY}/spellhighlight.diff  &&
    cd  ${SOURCE_DIRECTORY}
  fi                                          &&
                    

  ./configure --prefix=${TRACK_ROOT}/usr  \
          --sysconfdir=${TRACK_ROOT}/etc  \
       --localstatedir=${TRACK_ROOT}/var  \
              --mandir=${TRACK_ROOT}/usr/share/man   \
             --infodir=${TRACK_ROOT}/usr/share/info  \
                       $OPTS                 &&
  make DESTDIR=$INSTALL_ROOT


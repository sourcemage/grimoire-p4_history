(
  echo "This is a dummy spell."
  prepare_install
  mkdir -p  ${INSTALL_ROOT}/usr/share/doc/$SPELL
  touch     ${INSTALL_ROOT}/usr/share/doc/$SPELL/README
  echo "Dummy spell until the real $SPELL spell makes it into test/stable."  \
       >>  ${INSTALL_ROOT}/usr/share/doc/$SPELL/README
) > $C_FIFO 2>&1

(

  if test "$HTML_MULTI" == "y"; then
    # tarball contains html_single and text versions,
    # but they are not complete
    rm -rf html/HOWTO/text html/HOWTO/html_single
    mv html/HOWTO/* html
    rmdir html/HOWTO
  fi                                            &&

  prepare_install                               &&
  mkdir -p     ${INSTALL_ROOT}/usr/doc/$SPELL   &&
  cp    -a  *  ${INSTALL_ROOT}/usr/doc/$SPELL

) > $C_FIFO 2>&1  


(

  emacs  -batch -q -f batch-byte-compile cc-*.el          &&
  makeinfo  cc-mode.texi                                  &&
  prepare_install                                         &&
  mkdir  -p  /usr/share/emacs/site-lisp/cc-mode           &&
  install  cc-*.elc  /usr/share/emacs/site-lisp/cc-mode/  &&
  install  *.info    /usr/info/                           &&
  install  *.info-*  /usr/info/                           &&
  install-info --info-dir=/usr/info  /usr/info/cc-mode.info

) > $C_FIFO 2>&1

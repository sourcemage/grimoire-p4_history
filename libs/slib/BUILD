(

  prepare_install                 &&
  mkdir -p /usr/share/guile/slib  &&
  cp * /usr/share/guile/slib/     &&
  guile -c "(use-modules (ice-9 slib)) (require 'new-catalog)" "/"

) > $C_FIFO 2>&1

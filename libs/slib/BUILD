(

  prepare_install                       &&
  mkdir -p /usr/share/guile/1.6.0/slib  &&
  cp * /usr/share/guile/1.6.0/slib/     &&
  guile -c "(use-modules (ice-9 slib)) (require 'new-catalog)" "/"

) > $C_FIFO 2>&1

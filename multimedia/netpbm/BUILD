(

  echo  -e  "gnu\nregular\nshared\ny\n/usr\nbin\nlib\nlib\ninclude\n\n"  |
  ./configure      &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

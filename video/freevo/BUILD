(
  python setup.py build			&&
  prepare_install			&&
  python setup.py install
  mkdir /etc/freevo
  cp local_conf.py.example /etc/freevo/local_conf.py

) > $C_FIFO 2>&1

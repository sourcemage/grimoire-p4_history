(
  cd reportlab			&&
  python setup.py build		&& 
  prepare_install		&&
  python setup.py install	&&
  cd docs			&&
  python genAll.py		&&
  cd ..				
) > $C_FIFO 2>&1

(

  prepare_install              				&&
  python setup.py install --prefix=/usr 		&&

  mkdir -p /usr/doc/spambayes  				&& 
  /bin/cp $SOURCE_DIRECTORY/*.txt /usr/doc/spambayes/	&&
  /bin/cp $SOURCE_DIRECTORY/mboxtrain.py /usr/bin/

) > $C_FIFO 2>&1

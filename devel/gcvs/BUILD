(

  sedit  's/automake /automake -a /'  make_configure
  sedit  's/void UCvsFolders::DeleteAllItems(UTREEITEM root = 0L)/void UCvsFolders::DeleteAllItems(UTREEITEM root)/' common/UCvsFolders.cpp

  ./make_configure   \
      --prefix=/usr

  cd  cvsunix        &&
  ./configure        \
      --prefix=/usr  &&
  cd  ..             &&
  make               &&
  prepare_install    && 
  make  install

) > $C_FIFO 2>&1

(

  export    CFLAGS="$(  echo  $CFLAGS    |  sed  s/-ffast-math//  )"
  export  CXXFLAGS="$(  echo  $CXXFLAGS  |  sed  s/-ffast-math//  )"

  ./configure  --disable-tests              \
               --disable-debug              \
               --enable-optimize="$CFLAGS"  \
               --without-jpeg               \
               --without-zlib               \
               --without-png                \
               --enable-crypto              &&
  make                                      &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  rm     -f                          /usr/lib/mozilla/component.reg
  mkdir  -p                          /usr/lib/mozilla
  cp     -rL  dist/bin/*             /usr/lib/mozilla
  mkdir  -p                          /usr/include/mozilla
  cp	 -rL  dist/include/*         /usr/include/mozilla
  mkdir  -p                          /usr/include/moznss
  cp     -L   dist/public/security/* /usr/include/moznss  

  for  library  in  /usr/lib/mozilla/*.so;  do 
    libname=`basename  $library`
    ln  -sf  mozilla/$libname /usr/lib/$libname
  done

  cp  $SCRIPT_DIRECTORY/mozilla  /usr/bin

  export  MOZILLA_FIVE_HOME=/usr/lib/mozilla
  export    LD_LIBRARY_PATH=/usr/lib/mozilla:$LD_LIBRARY_PATH

         /usr/lib/mozilla/regxpcom
         /usr/lib/mozilla/regchrome
  touch  /usr/lib/mozilla/chrome/user-skins.rdf
  touch  /usr/lib/mozilla/chrome/user-locales.rdf

# The following lines have been commented out since they break the spell.
# The reason is that somewhere before this check is done, the files from 
# /etc/mozilla are deleted leaving the tree intact, leaving mozilla with
# no config files what so ever. 

#  if [ -d /etc/mozilla ]; then
#    echo "Old mozilla config in /etc/mozilla kept."
#    echo "New default config moved to /usr/lib/mozilla/new-defaults."
#    mv /usr/lib/mozilla/defaults/ /usr/lib/mozilla/new-defaults/
#  else
#    mv     /usr/lib/mozilla/defaults/ /etc/mozilla
#  fi
#  ln -s  /etc/mozilla/ /usr/lib/mozilla/defaults
)

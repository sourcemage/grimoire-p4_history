( 

  if  spell_installed "j2sdk-bin"
  then
    JAVA_PATH="/usr/lib/j2sdk*"
  elif  spell_installed  "j2sdk"
  then
    JAVA_PATH="/opt/java/j2sdk*"
  else
    JAVA_PATH=""
  fi

  chmod +x configure mkinstalldirs         &&

  ./configure  --build=${BUILD}            \
               --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var        \
               --with-jdk=${JAVA_PATH}     \
               ${OPTS}                     &&
  export MAKE_MODE=unix                    &&
  make                                     &&
  prepare_install                          &&
  make install

) > ${C_FIFO} 2>&1

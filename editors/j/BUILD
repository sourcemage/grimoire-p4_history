( 
  . /etc/profile.d/java.sh              &&
  chmod +x configure mkinstalldirs      &&

  ./configure  --build=${BUILD}         \
               --prefix=/usr            \
               --sysconfdir=/etc        \
               --localstatedir=/var     \
               --with-jdk=${JAVA_HOME}  \
               ${OPTS}                  &&
  export MAKE_MODE=unix                 &&
  make                                  &&
  prepare_install                       &&
  make install

) > ${C_FIFO} 2>&1

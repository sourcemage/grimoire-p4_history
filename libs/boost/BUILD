(

  # Doesn't like Python 2.3 yet
  #if  spell_installed  Python
  #then
  #  export  OPTS="${OPTS}  PYTHON_ROOT=/usr"    &&
  #  export  OPTS="${OPTS}  PYTHON_VERSION=2.3"
  #fi

  cd  libs/config                           &&
  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  cp  user.hpp  ../../boost/config          &&
  cd  ../..                                 &&
  bjam                                      &&
  prepare_install                           &&
  cp  -r  boost  /usr/include/boost

)  >  ${C_FIFO}  2>&1

(

  # Doesn't like Python 2.4 yet
  #if  spell_ok  python;  then
  #  export  OPTS="${OPTS}  PYTHON_ROOT=/usr"    &&
  #  export  OPTS="${OPTS}  PYTHON_VERSION=2.4"
  #fi  &&

  export CXXFLAGS="$CFLAGS"                 &&

  cd  libs/config                           &&
  chmod u+x configure                       &&
  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  cp  user.hpp  ../../boost/config          &&
  cd  ../..                                 &&
  bjam  -j $MAKE_NJOBS  \
      "-sBUILD=release <runtime-link>dynamic <threading>single"  &&

  prepare_install                           &&

  # Install libraries
  for  slib  in  $( find bin/boost/libs -name "*.so.*" -a \
        -path "*/release/*" -a ! -name "*gcc-mt-*" ) ; do
    tlib=${slib##*/}
    tlib=${INSTALL_ROOT}/usr/lib/${tlib/-gcc-*.so/.so}
    install  -m 755  $slib  $tlib  &&
    ln  -s  $tlib  ${tlib%%so.*}so
  done  &&

  # Install headers
  cp  -r  boost  /usr/include/boost

)  >  ${C_FIFO}  2>&1

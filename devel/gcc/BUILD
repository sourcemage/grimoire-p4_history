(

  if  [  -n  "$SOURCE2"  ]; then
    # install temporary ada compiler for bootstrapping
    cd  $SOURCE_DIRECTORY                                 &&
    unpack  $SOURCE2 ${MD5[1]}                            &&
    mkdir  smgl-gnat                                      &&
    cd  $S2_DIR                                           &&
    make  ins-all  prefix=$SOURCE_DIRECTORY/smgl-gnat     &&
    cd  $SOURCE_DIRECTORY                                 &&
    rm  -rf  $S2_DIR                                      &&
    export  PATH="$PATH:$SOURCE_DIRECTORY/smgl-gnat/bin"  &&
    export  ADAC=$SOURCE_DIRECTORY/smgl-gnat/bin/gcc
  fi  &&

  cd $SOURCE_DIRECTORY.bld                   &&
  $SOURCE_DIRECTORY/configure                \
               --host=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr  \
               --enable-threads=posix        \
               $FRONTENDS                    \
	       $OPTS                             &&

  make  bootstrap                       &&

  if  echo $FRONTENDS | grep -q ada; then
    # build ada tools and lib
    cd    gcc                &&
    make  gnatlib_and_tools  &&
    cd    ..
  fi  &&

  prepare_install                       && 

  if  [  -z  "$FIXEDINCLS"  ]
  then  make  install-no-fixedincludes  &&
        cp  -a  $SOURCE_DIRECTORY/libobjc/objc  \
                ${INSTALL_ROOT}/usr/lib/gcc-lib/$BUILD/$VERSION/include
  else  make  install
  fi                                    &&

  ln    -sf gcc ${INSTALL_ROOT}/usr/bin/cc                        &&
  ln    -sf  ../../../../bin/cpp                                  \
             ${INSTALL_ROOT}/usr/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  ${INSTALL_ROOT}/lib/cpp              &&
#stupid link needed by stupid apps expecting RedHat compat. libs
  ln -sf ${INSTALL_ROOT}/usr/lib/libstdc++.so                     \
         ${INSTALL_ROOT}/usr/lib/libstdc++-libc6.2-2.so.3 

) > $C_FIFO 2>&1

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

  # fix bug #7205
  sedit  's:#!/bin/sh:#!/bin/bash:'  $SOURCE_DIRECTORY/configure  &&
  cd $SOURCE_DIRECTORY.bld                                &&
  $SOURCE_DIRECTORY/configure                             \
               --host=$HOST                               \
               --prefix=/usr                              \
               --infodir=${INSTALL_ROOT}/usr/share/info   \
               --mandir=${INSTALL_ROOT}/usr/share/man     \
               --enable-threads=posix                     \
               $FRONTENDS                                 \
	       $OPTS                                      &&

  make  bootstrap                                         &&

  if  echo $FRONTENDS | grep -q ada; then
    # build ada tools and lib
    cd    gcc                &&
    make  gnatlib_and_tools  &&
    cd    ..
  fi  &&

  prepare_install                       && 

  if  [  -z  "$FIXEDINCLS"  ]
  then  make  prefix=${INSTALL_ROOT}/usr install-no-fixedincludes  &&
        cp  -a  $SOURCE_DIRECTORY/libobjc/objc  \
                ${INSTALL_ROOT}/usr/lib/gcc-lib/$HOST/$VERSION/include
  else  make  prefix=${INSTALL_ROOT}/usr install
  fi                                    &&

  ln    -sf gcc ${INSTALL_ROOT}/usr/bin/cc                        &&
  ln    -sf  ../../../../bin/cpp                                  \
             ${INSTALL_ROOT}/usr/lib/gcc-lib/$HOST/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  ${INSTALL_ROOT}/lib/cpp              &&
#stupid link needed by stupid apps expecting RedHat compat. libs
  ln -sf libstdc++.so ${INSTALL_ROOT}/usr/lib/libstdc++-libc6.2-2.so.3 

) > $C_FIFO 2>&1

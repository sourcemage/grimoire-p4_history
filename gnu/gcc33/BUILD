# fix bug #7205
sedit  's:#!/bin/sh:#!/bin/bash:'  $SOURCE_DIRECTORY/configure  &&

# GCC 3.3 supports AMD64 as -march=athlon64, unlike -march=k8 in 3.4
if [[ "${HOST%%-*}" == x86_64 ]]; then
  CFLAGS=${CFLAGS//k8/athlon64}     &&
  CXXFLAGS=${CXXFLAGS//k8/athlon84} &&
  export CFLAGS CXXFLAGS
fi &&

cd $SOURCE_DIRECTORY.bld                                  &&
$SOURCE_DIRECTORY/configure                               \
             --host=$HOST                                 \
           --prefix=${INSTALL_ROOT}/opt/gcc33             \
          --infodir=${INSTALL_ROOT}/opt/gcc33/share/info  \
           --mandir=${INSTALL_ROOT}/opt/gcc33/share/man   \
   --enable-threads=posix                                 \
 --enable-languages=c,c++                                 \
       $GCC_MULTILIB $OPTS                                &&

make  bootstrap

# fix bug #7205
sedit  's:#!/bin/sh:#!/bin/bash:'  $SOURCE_DIRECTORY/configure  &&
cd $SOURCE_DIRECTORY.bld                                  &&
$SOURCE_DIRECTORY/configure                               \
             --host=$HOST                                 \
           --prefix=/opt/gcc33                            \
          --infodir=${INSTALL_ROOT}/opt/gcc33/share/info  \
           --mandir=${INSTALL_ROOT}/opt/gcc33/share/man   \
   --enable-threads=posix                                 \
 --enable-languages=c,c++
       $OPTS                                              &&

make  bootstrap

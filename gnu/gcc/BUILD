  cd $SOURCE_DIRECTORY.bld                                  &&
# first set up the overall environment
  $SOURCE_DIRECTORY/configure                                \
               --host=$HOST                                  \
               --prefix=${INSTALL_ROOT}/usr                  \
               --infodir=${INSTALL_ROOT}/usr/share/info      \
               --mandir=${INSTALL_ROOT}/usr/share/man        \
               --enable-threads=posix                        \
               --with-system-zlib                            \
               $OPTS                                         &&

  make CFLAGS="$CFLAGS" BOOT_CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
               maybe-all-libiberty                           &&

message *** Saving build tree for GCC libraries spells       &&
mkdir -p save/gcc/doc/include save/libiberty save/include    &&

cd $SOURCE_DIRECTORY                                         &&
cp -a gcc/doc/include/*                                      \
           $SOURCE_DIRECTORY.bld/save/gcc/doc/include/       &&
cp -a gcc/version.c gcc/*.h $SOURCE_DIRECTORY.bld/save/gcc   &&
cp -a gcc/* $SOURCE_DIRECTORY.bld/save/gcc                   &&
# the following files are required, don't comment out!
cp -a config* Makefile* lt* libtool.m4 mkinstalldirs         \
           $SOURCE_DIRECTORY.bld/save                        &&
cp -a libiberty/cp-demangle.*                                \
           $SOURCE_DIRECTORY.bld/save/libiberty              &&
#cp include/demangle.h include/libiberty.h                   &&
cp -a include/*.h                                            \
           $SOURCE_DIRECTORY.bld/save/include                &&

cd $SOURCE_DIRECTORY.bld                                     &&
tar -cjf $DEST *                                             &&
#rm -r save                                                  &&
message *** now do bootstrap                                 &&

  make CFLAGS="$CFLAGS" BOOT_CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
       profiledbootstrap                                  &&
message ***Bootstrap finished

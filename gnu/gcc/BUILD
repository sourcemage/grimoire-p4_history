# install gcc libraries to /lib instead of /lib64
sedit "s/lib64/lib/" gcc/config/i386/linux64.h            &&
if [[ "$GCC_NOLIB64" == 'y' ]]; then
  # tell gcc to target binaries to expect the linker in /lib instead of /lib64
  sedit "s/lib64/lib/" gcc/config/i386/t-linux64           
fi                                                        &&

# store CFLAGS and LDFLAGS persistently so they can be read by the other
# split spells later, see bug #10087
GCC_CFLAGS="$CFLAGS"                   &&
GCC_LDFLAGS="$LDFLAGS"                 &&
persistent_add GCC_CFLAGS GCC_LDFLAGS  &&

cd $SOURCE_DIRECTORY.bld                                  &&
$SOURCE_DIRECTORY/configure                                \
             --host=$HOST                                  \
             --prefix=${INSTALL_ROOT}/usr                  \
             --infodir=${INSTALL_ROOT}/usr/share/info      \
             --mandir=${INSTALL_ROOT}/usr/share/man        \
             --enable-threads=posix                        \
             --with-system-zlib                            \
             $GCC_MULTILIB $OPTS                          &&

make CFLAGS="$CFLAGS" BOOT_CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
     profiledbootstrap

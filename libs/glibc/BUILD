  ### bug#5570 ccache sometimes has trouble correctly recognising minor differences 
  ### in configurations and doesn't force recompile when it should. This stops it from using the old cache entries.
  export CCACHE_RECACHE=true                  &&

  ### remove these from this spells log then
  ### in case glibc had provided these headers before
    for i in $INSTALL_LOGS/glibc*
    do if [ -f $i ] ; then sedit '/\/usr\/include\/asm/D' $i      &&
       sedit '/\/usr\/include\/linux/D' $i
       fi
    done                                      &&
  ###


  if [ "$NPTL" == "y" ] 
  then OPTS="$OPTS --enable-add-ons=nptl  --with-tls --enable-kernel=2.6"  &&
       patch -p0 < $SCRIPT_DIRECTORY/glibcshared.patch
  else OPTS="$OPTS --enable-add-ons=linuxthreads --enable-kernel=2.4" &&
  ### Apply gcc 3.3 patch
   bzcat   ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1 
  fi                                          &&
  if ! echo "$CFLAGS" | grep -q -- "-O"
  then export CFLAGS="$CFLAGS -Os"
  fi                                          &&
  if ! echo "$CXXFLAGS" | grep -q -- "-O"
  then  export CXXFLAGS="$CFLAGS -Os"
  fi                                          &&
  export CFLAGS="$(echo $CFLAGS | sed s/-ffast-math// )"  &&
  export CC=gcc                               &&
  cd $SOURCE_DIRECTORY.bld                    &&
  ### LD_LIBRARY_PATH includes $PWD bug 
  unset LD_LIBRARY_PATH                       &&
  $SOURCE_DIRECTORY/configure                 \
               --host=$HOST                   \
               --build=$BUILD                 \
               --prefix=/usr   \
               --infodir=/usr/share/info \
               --mandir=/usr/share/man   \
               --sysconfdir=/etc         \
               --with-elf                     \
               --enable-shared                \
               --disable-profile              \
               --with-headers="${INSTALL_ROOT}/usr/src/linux/include/" \
               $OPTS			      &&
  make                                        

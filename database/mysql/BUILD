  sed -i "42s|/usr||" cmd-line-utils/libedit/makelist     &&
  LD_PRELOAD_OLD="$LD_PRELOAD"                            &&
  unset  LD_PRELOAD                                       &&
  export CFLAGS="$CFLAGS -DUSE_OLD_FUNCTIONS"             &&
  if /lib/libc.so.6 | grep -q NPTL; then
    OPTS="$OPTS --with-named-thread-libs=-lpthread"         &&
    export CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE"
  fi  &&
  ./configure  --build=$BUILD                             \
               --prefix=/usr                              \
               --sysconfdir=/etc                          \
               --localstatedir=/var/lib/mysql             \
               --with-mysqld-user=mysql                   \
               --without-bench                            \
               --enable-assembler                         \
               --enable-thread-safe-client                \
               $OPTS                                      &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"                    &&
  make  pkglibdir=/usr/lib

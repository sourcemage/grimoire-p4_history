OPTS="$MSQL_SERVER $MSQL_INNODB $OPTS"             &&

#if  [  "$MSQL_SERVER"  !=  "--without-server"  ];  then
  create_account mysql                             &&
#fi                                                 &&

#if [ "$DEVEL" == "y" ];then
#  sed -i "42s|/usr||" cmd-line-utils/libedit/makelist     
#fi                                                 &&

LD_PRELOAD_OLD="$LD_PRELOAD"                       &&
unset  LD_PRELOAD                                  &&
export CFLAGS="$CFLAGS -DUSE_OLD_FUNCTIONS"        &&

if glibc_is_nptl; then
  OPTS="$OPTS --with-named-thread-libs=-lpthread"  &&
  export CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE"
fi  &&

./configure  --build=$BUILD                        \
            --prefix=$INSTALL_ROOT/usr             \
        --sysconfdir=$INSTALL_ROOT/etc             \
            --mandir=$INSTALL_ROOT/usr/share/man   \
           --infodir=$INSTALL_ROOT/usr/share/info  \
     --localstatedir=/var/lib/mysql                \
  --with-mysqld-user=mysql                         \
           --without-bench                         \
            --enable-assembler                     \
            --enable-thread-safe-client            \
                     $OPTS                         &&

export  LD_PRELOAD="$LD_PRELOAD_OLD"               &&
make  pkglibdir=/usr/lib

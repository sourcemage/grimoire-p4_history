(


  groupadd  mysql             2>/dev/null
  useradd   mysql  -g  mysql  2>/dev/null

  LD_PRELOAD_OLD="$LD_PRELOAD"                            &&
  unset  LD_PRELOAD                                       &&
  ./configure  --prefix=/usr                              \
               --without-bench                            \
               --enable-assembler                         \
               --with-mysqld-ldflags=-all-static          \
               --localstatedir=/var/lib/mysql             \
               $OPTS                                      &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"                    &&
  make  pkglibdir=/usr/lib                                &&
  prepare_install                                         &&
  make  pkglibdir=/usr/lib  install                       &&
  rm    -rf  /usr/mysql-test                              &&
  if ! grep  -q  "\--without-server" $SPELL_CONFIG;  then
    mysql_install_db
    chown  -R  mysql.mysql  /var/lib/mysql
    cp  /usr/share/mysql/mysql.server  /etc/init.d

    case  $MYSQL_BOOT  in

      y|Y|j|J)  ln  -sf  ../init.d/mysql.server    /etc/rc0.d/K10mysql
                ln  -sf  ../init.d/mysql.server    /etc/rc6.d/K10mysql
                ln  -sf  ../init.d/mysql.server    /etc/rc3.d/S90mysql
                ln  -sf  ../init.d/mysql.server    /etc/rc4.d/S90mysql
                ln  -sf  ../init.d/mysql.server    /etc/rc5.d/S90mysql
                ;;
            *)  true
                ;;
   esac
  fi

) > $C_FIFO 2>&1

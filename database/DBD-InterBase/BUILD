(
answer()
{
cat <<EOF
/usr/firebird/bin
/usr/firebird/include
/usr/firebird/lib
/tmp/test.fdb
sysdba
masterkey
EOF
}

  answer | perl  Makefile.PL  &&
  sedit "s/CCFLAGS =/CCFLAGS +=$CFLAGS -DIB_API_V6/" Makefile	&&
  make               &&
  make test	&&
  prepare_install    &&
  make    install

) >> $C_FIFO 2>&1

(
answer()
{
cat <<EOF
/usr/firebird/bin
/usr/firebird/include
/usr/firebird/lib
./test.fdb
sysdba
masterkey
EOF
}
  sedit \
"298,304d;s#path = ''#path = '/usr/firebird/bin'#;s#=> ''#=> '$CFLAGS'#" \
	Makefile.PL				&&
  answer | perl  Makefile.PL  			&&
  make               				&&
  make test					&&
  prepare_install    				&&
  make    install

) >> $C_FIFO 2>&1

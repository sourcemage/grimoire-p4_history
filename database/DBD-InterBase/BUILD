(
answer()
{
cat <<EOF
/opt/firebird/bin
/opt/firebird/include
/opt/firebird/lib
/tmp/test.fdb
sysdba
masterkey
EOF
}
#ib_bin_dirs

#export path=/usr/firebird/data/test.fdb
#export path=/tmp/test.fdb
#export user=SYSDBA
#export pass=masterkey

#IB_Bin_path=/opt/firebird/bin			&&
#export isql_name=isql
#export PATH=$PATH:$IB_Bin_path			&&
#  echo "\n\n\n/opt/firebird/examples/test.fdb\nsysdba\nmasterkey\n" | 

  answer | perl  Makefile.PL  &&
  sedit "s/CCFLAGS =/CCFLAGS +=$CFLAGS -DIB_API_V6/" Makefile	&&
  make               &&
  make test	&&
  prepare_install    &&
  make    install

) >> $C_FIFO 2>&1

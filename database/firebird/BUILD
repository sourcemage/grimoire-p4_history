(
# Classic Server install needs services or xinet.d
# Super Server install needs init.d
# at present the build only works for everything in one directory 
# tree /usr/firebird

  PREFIX=${INSTALL_ROOT}/usr/firebird		&&

# fix compiler flags
  sed -i -e "s/-O3 -march=i586 -mcpu=i686/$CFLAGS/" \
	builds/posix/prefix.linux	&&

echo install=$INST				&&

NOCONFIGURE=1 . ./autogen.sh			&&
#        --sysconfdir=/etc/firebird 	\
#        --localstatedir=/var/firebird  	\
#	--datadir=$PREFIX/share/firebird\

  ./configure 				\
	--prefix=$PREFIX 		\
	--with-editline			\
	$OPTS					&&

#  make layout=gnu				&&
  make 						&&
  
  prepare_install				&&

# new install script from here on
  SRC=$PWD/gen/firebird				&&

  VV=`$SRC/bin/gpre_static -z 2>/dev/null | grep Fire |cut -c 14-` &&
  echo installing $VV				&&

  mkdir -p $PREFIX				&&
  cd $PREFIX					&&
  mkdir -p bin examples				&&

# config, msg and security
  touch aliases.conf 				&&
  cp $SRC/*.msg $SRC/isc* ./			&&

  FF=security.fdb				&&
  if [ ! -f $FF ];then 
    cp $SRC/$FF ./
  fi						&&

  FF=firebird.conf				&&
  if [ ! -f $FF ];then
    cp $SRC/misc/$FF ./
  fi						&&



# programs and scripts
  cd bin 					&&
  FF=changeDBAPassword.sh			&&
  if [ ! -f $FF ];then
    cp $SRC/bin/$FF ./				&&
    sed -e "s:rc\.d/::;s:d/f:d/runlevels/\%3/f:" -i ./$FF
  fi						&&

  FL="fb* gds* gfix gpre gsec gstat gbak isql"	&&
  if [ "$INST" == "classic" ]; then
    FL="$FL gdef qli"
    GDS=libembed
  else
    GDS=libclient
  fi						&&
  for FF in $FL
  {
      cp $SRC/bin/$FF ./
  }						&&
  ln -sf $PWD/isql /usr/bin/fbisql		&&
  ln -sf $PWD/gpre /usr/bin/gpre		&&
  cd ..						&&

# examples
  cp $SRC/examples/v5/* examples/		&&

# help, include, intl, UDF

  for DD in help include intl UDF 
  {
    cp -r $SRC/$DD ./
  }						&&

# libraries
  mkdir lib					&&
  cd lib					&&
  for FF in `ls $SRC/lib/lib{fb,ib}*.so $SRC/lib/lib*.a`
  {
    cp $FF ./
  }						&&

  echo making symlinks for libraries		&&
  for FF in `ls lib*.so`
  {
    ln -sf $PWD/$FF /usr/lib/$FF		&&
    ln -sf $PWD/$FF /usr/lib/$FF.1  		&&
    ln -sf $PWD/$FF /usr/lib/$FF.1.5
  }						&&
  for FF in `ls lib*.a`
  {
    ln -sf $PWD/$FF /usr/lib/$FF
  }						&&
# for use by existing applications
  ln -sf $PWD/$GDS.so /usr/lib/libgds.so	&&
  cd ..						&&

# symlink for includes
  ln -sf $PWD/include /usr/include/firebird	&&

# fix permissions
  chown -R firebird:firebird $PREFIX		&&

  chmod -R o-rw,ug+rx $PREFIX/*			&&
  chmod ug=r *.msg				&&
  chmod ug=rw isc* *.conf security.fdb		&&

  chmod ug=x bin/*				&&
  chmod a=x bin/isql bin/gpre include		&&
  chmod u=rw,og-wx bin/changeDBAPassword.sh	&&
  chmod a=rx include				&&

  chmod a=r help/* include/* intl/* lib/* UDF/*	&&


  chmod a=r examples/*				&&
  chmod ug+w examples/*.fdb			&&

# log file
  mkdir -p /var/log/				&&
  touch  /var/log/firebird.log			&&
  chown firebird:firebird /var/log/firebird.log	&&
  chmod o=,ug=rw /var/log/firebird.log		&&
  ln -sf /var/log/firebird.log ./
  
) > $C_FIFO 2>&1

(
# Classic Server install needs services or xinet.d
# Super Server install needs init.d
# at present the build only works for /opt/firebird
  PREFIX=${INSTALL_ROOT}/opt/firebird

# apply Erik LaBianca's patches for a more logical install
# not yet
#patch -u -p0 < $SPELL_DIRECTORY/patches/ac_cxxflags.patch	&&
#sed -e "s:@abs_builddir@:$SOURCE_DIRECTORY/gen/firebird:" 	\
#	$SPELL_DIRECTORY/patches/install.patch 			\
#	| patch -u -p0						&&
#patch -u -p0 < $SPELL_DIRECTORY/patches/install.patch		&&
#patch -u -p0 < $SPELL_DIRECTORY/patches/xinetd.patch		&&

if [ ! -z "$SS" ]
then
  OPTS=" --enable-superserver $OPTS"
  INST=" --super"
else
  INST=" --classic"
fi						&&

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
  
# make the environment ccompatible with the binary install script
  ln -sf gen/firebird data			&&
  ln -sf $SPELL_DIRECTORY/scripts data		&&
  ln -sf $SOURCE_DIRECTORY/doc data				&&
  cd data					&&
  ln -sf $SOURCE_DIRECTORY/doc/WhatsNew ./			&&
  ln -sf $SOURCE_DIRECTORY/doc/README.user ./README		&&
  ln -sf $SOURCE_DIRECTORY/data/misc/firebird.conf ./		&&
  touch aliases.conf				&&
  cd ..						&&

  cd doc					&&
  rm -rf CVS					&&
  mv sql.extensions/* ./			&&
  rm -r sql.extensions				&&
  rm -rf CVS					&&
  cd ..						

  prepare_install				&&

  mkdir -p $PREFIX				&&
# this is a modified version of the Firebird install script
  $SPELL_DIRECTORY/scripts/install.sh.cp          \
        $INST --doc --libs --nouninstall    \
        --all --tools --runas=firebird --verbose --auto	

# default install
#  make layout=gnu install			&&

#  if [ ! -z "$SS" ];then
#their install puts script in wrong location and leaves server running
# let's stop it and remove the script
#    /etc/init.d/firebird stop			&&
#    rm -f /etc/init.d/firebird			
#  fi						&&
#  exit

  
) > $C_FIFO 2>&1

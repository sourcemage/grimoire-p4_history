(
 # security fix from http://security.e-matters.de/advisories/012004.html
 if [ "$CVS" = "no" ]; then
   patch  -p0  <  ${SOURCE_CACHE}/${SOURCE3}
 fi  &&

 ### had to cook up some pkg-config files for nss and nspr 
  if spell_installed nss
  then export PKG_CONFIG_PATH="/usr/include/nss:/usr/include/nspr" 
  fi                                             &&
 if [ "$CVS" = "yes" ] ; then ./autogen.sh; fi   &&
 ./configure  --build=$BUILD                     \
              --prefix=/usr                      \
              --sysconfdir=/etc                  \
              --localstatedir=/var               \
              $OPTS                              &&
 make                                            &&
  if [ "$GAIM_ENCRYPTION" = "y" ] ; then
	cd plugins/gaim-encryption-$VERSION2     &&
     if [ "$CVS" = "yes" ];then ./autogen.sh ;fi &&
	./configure  --build=$BUILD              \
               --prefix=/usr                     \
               --sysconfdir=/etc                 \
               --localstatedir=/var              \
               $OPTS                             &&
  make      
  fi                                             &&
 cd $SOURCE_DIRECTORY                            &&
 prepare_install                                 &&
 make    install                                 &&
 cp plugins/*.pl /usr/lib/gaim                   &&
  if [ "$GAIM_ENCRYPTION" = "y" ] ; then
    cd plugins/gaim-encryption-$VERSION2/        &&
    make install
  fi

) > $C_FIFO 2>&1

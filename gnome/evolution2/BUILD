(
   mkdir  evolution-db3                                         &&
   cd  db-$DBVERSION/build_unix                                 &&
   ../dist/configure  --prefix=$SOURCE_DIRECTORY/evolution-db3  \
                      --disable-dynamic                         &&
    
   make                                                         &&
   make  install                                                &&
 
   cd $SOURCE_DIRECTORY                                         &&
   
   OPTS="$OPTS --with-db3=$SOURCE_DIRECTORY/evolution-db3"      &&

   if grep -q "--enable-nss=yes" $SPELL_CONFIG; then
     sedit s/"nsslibs=\"-lssl3 -lsmime3 -lnss3\""/"nsslibs=\"-lssl3 -lsmime3 -lnss3 -lsoftokn3\""/ configure
   fi &&

   echo $OPTS

   default_build
 
) > $C_FIFO 2>&1

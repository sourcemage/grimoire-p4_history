(
    for i in openmosixcollector openmosixanalyzer openmosixhistory openmosixprocs openmosixmigmon .  
     do
       cd $SOURCE_DIRECTORY/$i               &&
       ./configure --enable-mt               &&
       make
     done                                    &&

    for i in 3dmosmon mosstatd
    do
      cd  $SOURCE_DIRECTORY/3dmon/$i         &&
      make
    done

    prepare_install                          &&

    cd $SOURCE_DIRECTORY                     &&

   /bin/cp  -v                                                 \
     openmosixview/openmosixview                               \
     openmosixprocs/openmosixprocs/openmosixprocs              \
     openmosixcollector/openmosixcollector/openmosixcollector  \
     3dmon/3dmosmon/3dmosmon                                   \
     3dmon/mosstatd/mosstatd                                   \
     openmosixanalyzer/openmosixanalyzer/openmosixanalyzer     \
     openmosixhistory/openmosixhistory/openmosixhistory        \
     openmosixmigmon/openmosixmigmon/openmosixmigmon           \
                               /usr/bin/                       &&
				
   /bin/cp -v openmosixcollector/openmosixcollector.init       \
                            /etc/init.d/openmosixcollector.sh  &&
   for  RUNLEVEL  in  3  4  5
   do
     ln  -svf  /etc/init.d/openmosixcollector.sh               \
       /etc/rc${RUNLEVEL}.d/S55openmosixcollector
   done

   for  RUNLEVEL  in  0  1  2  6
   do
     ln  -svf  /etc/init.d/openmosixcollector.sh               \
       /etc/rc${RUNLEVEL}.d/K45openmosixcollector
   done

) > $C_FIFO 2>&1

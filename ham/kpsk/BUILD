if    [  "$( installed_version db  |  cut  -c1  )"  ==  "4"  ]
then  sedit  "s/db-3/db-4/"  configure
  echo  "modifying configure with db-4"  >  /kpsk.log
fi
sedit  's/$$(kde_appsdir)/$(kde_appsdir)/'  kpsk/Makefile.in
default_build

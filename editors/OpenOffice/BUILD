do_bootstrap()
{

  #
  # Begin dmake creation
  #
  cd  dmake                                                &&
  ./configure                                              &&
  sedit  's:$(OS):dmake/unix/$(OS):'  makefile.mk          &&
  sedit  's:/usr/local/share:dmake:'  dmakeroot.h          &&
  sedit  's:sysintf.h:unix/sysintf.h:'  dmake.c            &&
  sedit  's:sysintf.h:unix/sysintf.h:'  make.c             &&
  sedit  's:public.h:unix/linux/gnu/public.h:'  extern.h   &&
  sedit  's:sysintf.h:unix/sysintf.h:'  makefile.mk        &&
  make                                                     &&
  cd  ..                                                   &&
  #
  # End dmake creation
  #

  #
  # Begin environ setup
  #
  mkdir -p $SOLARENV/$OUTPATH/bin                     &&
  cp -f $SRC_ROOT/dmake/dmake $SOLARENV/$OUTPATH/bin  &&

  # create a minor.mk file

  if [ ! -x $SOLARVER/$UPD/$INPATH/inc/${UPD}minor.mk ]
  then
    mkdir -p $SOLARVER                           &&
    mkdir -p $SOLARVER/$UPD                      &&
    mkdir -p $SOLARVER/$UPD/$INPATH              &&
    mkdir -p $SOLARVER/$UPD/$INPATH/inc          &&

    cd $SOLARVER/$UPD/$INPATH/inc                &&
    cat $SOLARENV/inc/minor.mk > ${UPD}minor.mk  &&
    cd ${SRC_ROOT}
  fi                                             &&

  chmod +x solenv/bin/build.pl       &&
  chmod +x solenv/bin/zipdep.pl      &&
  chmod +x solenv/bin/gccinstlib.pl
  #
  # End environ setup
  #

}

(

  echo  LANGUAGE = ${LANGUAGE}
  echo  LANGUAGES = ${LANGUAGES}

  cd  config_office                         &&
  ./configure   --host=${HOST}              \
               --build=${BUILD}             \
              --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
           --with-lang=${LANGUAGE}          \
           --with-dict=${DICTIONARY}        \
  --with-stlport4-home=/usr                 \
       --with-ant-home=/opt/ant             \
              --enable-libart               \
                       $OPTS                &&
  cd  ..                                    &&
  .  LinuxIntelEnv.Set.sh                   &&
  do_bootstrap                              &&
  #
  # Keep getting this error:
  # cp: cannot stat `/dmake/dmake': No such file or directory
  # dmake:  solenv/inc/target.mk:  line 2933:  Error -- Expecting
  # macro or rule defn, found neither
  # I think those lines need TABs instead of SPACEs
  #
  patch  -p0  <  ${SCRIPT_DIRECTORY}/target.mk.patch  &&
  ./dmake/dmake

)  >  ${C_FIFO}  2>&1

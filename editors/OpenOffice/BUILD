do_bootstrap()
{
  #
  # Just in case...
  #
  sh  LinuxIntelEnv.Set.sh                    &&

  #
  # Begin dmake creation
  #
  cd  dmake                                                      &&
  ./configure                                                    &&
  sedit  's:$(OS):dmake/unix/$(OS):'  makefile.mk                &&
  sedit  's:/usr/local/share:dmake:'  dmakeroot.h               &&
  sedit  's:sysintf.h:unix/sysintf.h:'  dmake.c            &&
  sedit  's:sysintf.h:unix/sysintf.h:'  make.c             &&
  sedit  's:public.h:unix/linux/gnu/public.h:'  extern.h   &&
  sedit  's:sysintf.h:unix/sysintf.h:'  makefile.mk        &&
  make                                                           &&
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
  if                                             &&

  #make sure build.pl is executable

  chmod +x solenv/bin/build.pl       &&
  chmod +x solenv/bin/zipdep.pl      &&
  chmod +x solenv/bin/gccinstlib.pl

  # My own cleanup
  sedit  's:target.mk:solenv/inc/target.mk:'  ../makefile.mk  &&
  for i in `grep .mk ../solenv/inc/target.mk | grep INCLUDE | \
            grep -v IGNORE | awk '{print $3}'`
  do
    sedit  "s:$i:solenv/inc/$i:'  ../solenv/inc/target.mk
  done
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
  sh  LinuxIntelEnv.Set.sh                  &&
  do_bootstrap                              &&
  dmake/dmake

)  >  ${C_FIFO}  2>&1

(

  if [ -f /etc/profile.d/java.sh ]; then
    . /etc/profile.d/java.sh
  fi                                      &&
  . $SCRIPT_DIRECTORY/../java-functions   &&
  
  set_java_env				  &&
  
  if [ "$WITH_ANTLR" == "y" ]; then
    if spell_installed antlr
    then
      export CLASSPATH="${SM_OTH_HOME}/lib/antlr.jar:$CLASSPATH"
    fi
  fi                                      &&

  ./build.sh -Ddist.dir=antbuild dist     &&
  prepare_install                         &&
  mkdir -p /opt/ant                       &&
  cp -R antbuild/* /opt/ant               &&
  mkdir -p ${INSTALL_ROOT}/etc/profile.d/ &&
  install -m 0644 $SCRIPT_DIRECTORY/ant.sh ${INSTALL_ROOT}/etc/profile.d/  

) >$C_FIFO  2>&1

(

  . $SCRIPT_DIRECTORY/../java-functions
  
  set_java_env				
  
  if [ "$WITH_ANTLR" == "y" ]; then
    if spell_installed antlr
    then
      export CLASSPATH="${SM_OTH_HOME}/lib/antlr.jar:$CLASSPATH"
    fi
  fi

  export PATH=$PATH:$JAVA_HOME/bin      &&

  ./build.sh -Ddist.dir=antbuild dist   &&

  prepare_install                       &&

  mkdir -p /opt/ant                     &&
  cp -R antbuild/* /opt/ant				

)  >  $C_FIFO  2>&1

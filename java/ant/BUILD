(

  if  [  -z  $JAVA_HOME  ]
  then
    if  spell_installed  j2sdk
    then
      export  JAVA_HOME=/opt/java/j2sdk
    elif  spell_installed  j2sdk-bin
    then
      export  JAVA_HOME=/usr/lib/j2sdk1.4.1
    fi
  fi

  export PATH=$PATH:$JAVA_HOME/bin      &&
  ./build.sh -Ddist.dir=antbuild dist   &&
  prepare_install                       &&
  mkdir -p /opt/ant                     &&
  cp -R antbuild/* /opt/ant				

)  >  $C_FIFO  2>&1

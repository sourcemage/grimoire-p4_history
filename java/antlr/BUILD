(

  . $SECTION_DIRECTORY/java-functions
    
  set_java_env				&&
  
  export PATH=$PATH:$JAVA_HOME/bin	&&
  export CLASSPATH=.			&&
  
  java antlr.build.Tool build		&&
  java antlr.build.Tool jar		&&
  
  prepare_install							&&
  
  extract_oth_src   ${SPELL} ${SPELL}-${VERSION}  $SOURCE_DIRECTORY     &&
  register_oth_jar  ${SPELL}-${VERSION}/antlr.jar        antlr.jar   

)  >  $C_FIFO  2>&1

if [ -f /etc/profile.d/java.sh ]; then
  . /etc/profile.d/java.sh
fi                                      &&
. $SCRIPT_DIRECTORY/../java-functions   &&
  
set_java_env                            &&
  
if [ "$WITH_ANTLR" == "y" ]; then
  if spell_installed antlr
  then
    export CLASSPATH="${SM_OTH_HOME}/lib/antlr.jar:$CLASSPATH"
  fi
fi                                      &&

./build.sh -Ddist.dir=antbuild dist

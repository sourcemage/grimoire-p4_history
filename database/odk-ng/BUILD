cd odkda                   &&
chmod u+x ./compile.sh     &&
./compile.sh               &&
if spell_ok g++; then
  cd odkda-cpp             &&
  chmod u+x ./compile.sh   &&
  ./compile.sh             &&
  cd ..
fi                         &&
if spell_ok mono; then
  cd odkda-sharp           &&
  chmod u+x ./compile.sh   &&
  ./compile.sh             &&
  cd ..
fi
#
#  default_build
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
#  make                   &&
#  prepare_install        &&
#  make    install        


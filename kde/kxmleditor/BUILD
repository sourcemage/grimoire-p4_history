  sedit "s/};/}/" part/kxmleditorfactory.cpp  &&
# temporary patch for qt-3.3
  cd part                                     &&
  local FF                                    &&
  for FF in `ls *.ui`;do 
    sed -i "s/3\.1/3\.3/;s/3\.2/3\.3/" $FF
  done                                        && 
  cd ..                                       &&
  default_build

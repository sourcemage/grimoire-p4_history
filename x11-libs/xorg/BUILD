message  "${MESSAGE_COLOR}Building X.org takes a very long time${DEFAULT_COLOR}"  &&

# Do not remove PIC switches from compiler flags!

if  (echo $CFLAGS | grep -q -- "-Os"); then
  export CFLAGS="-O2 ${CFLAGS//-Os/}"
fi  &&

make  World

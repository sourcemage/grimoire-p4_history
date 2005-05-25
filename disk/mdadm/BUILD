# Temporary fix for gcc 4.0 - some warnings are considered as errors
# That should be no longer needed in future versions - check on upgrades
local GCCV=`gcc --version` &&

if [ "${GCCV:10:3}" == "4.0" ]
then
   cd ${SOURCE_DIRECTORY} &&
   sed -i "s/-Werror//" Makefile
fi	&&
make

GCC_VER=$(installed_version gcc)

cd includes &&
if [ "${GCC_VER%[0-9]}" == "3.4." ]
then
	patch -p0 <${SCRIPT_DIRECTORY}/dhcpd.h.patch 
fi &&
cd ../ &&
./configure &&
make

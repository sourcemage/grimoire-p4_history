GCC_VER=$(installed_version gcc)
sedit "s/\/local//" Makefile.conf &&
if [ "${GCC_VER%[0-9]}" == "3.4." ]
then
	patch includes/dhcpd.h ${SCRIPT_DIRECTORY}/dhcpd.h.patch 
fi &&
./configure &&
make

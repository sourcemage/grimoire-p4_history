export BUILD_OPT=1                              &&
LINUX_VERSION=`uname  -r  |  cut  -d. -f1,2,3`  &&
cd  security/nss                                &&
cp  ../coreconf/Linux2.5.mk                     \
    ../coreconf/Linux2.6.mk                     &&
cp  ../coreconf/Linux2.5.mk                     \
    ../coreconf/Linux${LINUX_VERSION}.mk        &&
make  nss_build_all

export BUILD_OPT=1                                 &&
persistent_add  NSS_LINUX_VERSION                  &&
if  [  `uname  -r  |  cut  -d-  -f1  |  wc  -c`  -gt  6  ];  then
  NSS_LINUX_VERSION=`uname  -r  |  cut  -c  1-5`
else
  NSS_LINUX_VERSION=`uname  -r  |  cut  -c  1-3`
fi                                                 &&
cd  security/nss                                   &&
cp  ../coreconf/Linux2.5.mk                        \
    ../coreconf/Linux${NSS_LINUX_VERSION}.mk       &&
make  nss_build_all

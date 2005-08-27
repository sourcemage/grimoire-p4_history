create_account  courier                                  &&

OPTS="${OPTS}                                            \
            --datadir=${INSTALL_ROOT}/usr/share/courier  \
         --sysconfdir=${INSTALL_ROOT}/etc/courier        \
      --localstatedir=${INSTALL_ROOT}/var/courier        \
      --without-stdheaderdir                             \
       --with-mailuser=courier                           \
      --with-mailgroup=courier                           \
      --disable-root-check                               \
      --with-shellpath=${PATH}"                          &&

default_build


#LDFLAGS=${LDFLAGS//-z combreloc/}                                      &&

#./configure                                                            \
#             --prefix=${INSTALL_ROOT}/usr                              \
#             --with-mailuser=courier                                   \
#             --with-mailgroup=courier                                  \
#             ${OPTS}                                                   &&

#sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.log     &&
#sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.status  &&
#sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/Makefile       &&

#make


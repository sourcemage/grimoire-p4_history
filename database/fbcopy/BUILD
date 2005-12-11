 cd source      &&
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  sed -i \
-e "s/-03/$CFLAGS/;s/\$(IBPP_PATH)//g;s:-I:-I/usr/include:" \
-e "s|/release/linux|/usr/lib|" \
		Makefile	&&
# fix bad declaration
  sed -i "s/__int64/int64_t/" fbcopy.cpp  &&
  make

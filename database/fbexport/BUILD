cd source   &&
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  sed -i -e \
"s/-03/$CFLAGS/;s/\$(IBPP_PATH)//g;s/-L//;s:-I:-I/usr/include:" \
		Makefile	&&
  make                          &&
  if spell_ok wxgtk;then
  cd gui                        &&
  sed -i -e \
"s/\$(IBPP_PATH)//g;s/-L//;s:-I:-I/usr/include:;s/gtk-2.4//" \
                Makefile        &&
  make                          && 
  cd ..
fi

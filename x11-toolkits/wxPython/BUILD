(

#  patch -p1 < $SCRIPT_DIRECTORY/glcanvas.diff &&
  cd wxPython &&
  python setup.py WXPORT=gtk2 build &&

  prepare_install &&
  python setup.py WXPORT=gtk2 install

) >$C_FIFO 2>&1

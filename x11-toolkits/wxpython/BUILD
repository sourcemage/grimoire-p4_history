  sed -i "s/ogl//" contrib/src/Makefile.in  &&
  cd wxPython &&
if spell_ok swig;then
  python setup.py USE_SWIG=1 WXPORT=gtk2  CORE_ONLY=1 build
else
  python setup.py WXPORT=gtk2  CORE_ONLY=1 build
fi

export CPPFLAGS=-I/usr/include/freetype2  &&

if  [  "$CVS"  ==  "y"  ];  then
  ./autogen.sh
else
    patch  -p0  <  $SCRIPT_DIRECTORY/fluxbox-0.9.9-gcc3.4.patch
fi  &&

if  [  "$NLS"  ==  "n"  ];  then
  OPTS="$OPTS --disable-nls"
fi   &&

default_build

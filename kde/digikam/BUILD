#  patch -p1 <$SPELL_DIRECTORY/gcc.diff &&
if  [  "$CVS"  ==  "y"  ];  then
  sedit  "87d"  admin/cvs.sh  &&
  make  -f  Makefile.cvs
fi  &&
default_build

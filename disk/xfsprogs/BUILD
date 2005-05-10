patch -p0  <  $SCRIPT_DIRECTORY/Makefile.patch  &&

export  OPTIMIZER=$CFLAGS         &&
rm      configure                 &&

# DEBUG=-DNDEBUG is needed to get the spell compiling
# However the variable must not be exported otherwise
# Sorcery will create a /-DNDEBUG file at the end of install
make    configure DEBUG=-DNDEBUG  &&
make

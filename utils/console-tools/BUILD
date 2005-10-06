patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch  &&

sedit "s/doc//"       Makefile.am  &&
sedit "s/doc//"       Makefile.in  &&
sedit "s/examples//"  Makefile.am  &&
sedit "s/examples//"  Makefile.in  &&

cp $SCRIPT_DIRECTORY/config.sub .

export CFLAGS="-O1 $CFLAGS"           &&
#for gcc3.3
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
sedit "s/hack\!\\\n/hack\!\\\n \\\ /g" contrib/codepage.c 
fi  &&
./configure  --host=$BUILD                         \
             --prefix=$INSTALL_ROOT/usr            \
             --mandir=$INSTALL_ROOT/usr/share/man  \
       $OPTS		     &&
make

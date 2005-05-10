bunzip2  -cd  $SCRIPT_DIRECTORY/gcc-2.95.3-2.patch.bz2  |
patch  -p 1

if    [  "$PASCAL"  ==  "y"  ]
then  sedit  "s/read junk//"  gcc/p/config-lang.in  &&
      sedit  's/for f in `cd p/for f in `cd $(srcdir)\/p/'  gcc/p/Make-lang.in
fi

cd $SOURCE_DIRECTORY.bld              &&

$SOURCE_DIRECTORY/configure           \
             --host=$BUILD            \
             --prefix=${INSTALL_ROOT}/opt/gcc2       \
             --enable-shared          \
             $LANGS                   \
             $OPTS                    &&
make  bootstrap

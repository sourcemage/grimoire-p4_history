# they should not redefine behavior of a standard variable
find -name makefile | while read M; do
  sedit 's|CFLAGS|COMPILE_FLAGS|g'        $M &&
  sedit 's/^\(LIBXVT\|X11_LIBS\).*=.*//g' $M
done &&
if echo $OPTS | grep -q 'without-x'; then XT_ENV=linux-nox; else XT_ENV=linux; fi
source build -r $XT_ENV &&
make

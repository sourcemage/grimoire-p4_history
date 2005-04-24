export OPT="$CFLAGS"
export OPTS="$OPTS --enable-shared"
sedit "s/\['ndbm'\]/\['ndbm', 'gdbm_compat'\]/g" setup.py &&

# The following file from kdebindings has a syntax error that
# makes Python compilation fail
if [ -f /usr/lib/python2.4/pydcop.py ];  then
  mv  /usr/lib/python2.4/pydcop.py /tmp
fi  &&

default_build

(
OPT="$CFLAGS"
sedit "s/\['ndbm'\]/\['ndbm', 'gdbm_compat'\]/g" setup.py &&

# The following file from kdebindings has a syntax error that
# makes Python compilation fail
if [ -f /usr/lib/python2.3/pydcop.py ];  then
  mv  /usr/lib/python2.3/pydcop.py /tmp
fi  &&

default_build  &&

if [ -f /tmp/pydcop.py ];  then
  mv /tmp/pydcop.py /usr/lib/python2.3
fi

)  >  ${C_FIFO}  2>&1

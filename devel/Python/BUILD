(
OPT="$CFLAGS"
sedit "s/\['ndbm'\]/\['ndbm', 'gdbm_compat'\]/g" setup.py &&
default_build
)  >  ${C_FIFO}  2>&1

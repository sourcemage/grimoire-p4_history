(

export OPTS=`echo $OPTIMIZATIONS | sed 's/ / -z /g'` &&
export FLAGS=$CFLAGS &&

make  all	&&
make  install	&&

rm -rf /usr/src/Csound

) > $C_FIFO 2>&1

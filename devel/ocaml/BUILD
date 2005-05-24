[[  $CROSS_INSTALL  ==  on  ]]  &&  OPTS="$OPTS  -host  ${HOST}"

./configure  -prefix  ${INSTALL_ROOT}/usr            \
             -mandir  ${INSTALL_ROOT}/usr/share/man  \
             ${OPTS}                                 &&

make_single                                          &&
invoke_gcc                                           &&
make  world                                          &&
make  opt                                            &&
make  opt.opt                                        &&
make_normal

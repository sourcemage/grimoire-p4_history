export  OPTS="${OPTS}  --enable-notify=no --infodir=${INSTALL_ROOT}/usr"  &&
sedit "s/--target=pentium/--enable-cxx/" configure                        &&
make_single                                                               &&
default_build                                                             &&
make_normal

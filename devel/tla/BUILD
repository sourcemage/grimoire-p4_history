# gcc 4.0 fix
sedit  "s:static \(struct vu_fs_discipline\):\1:"  \
       src/hackerlab/vu/vu-virtual-null.c  &&
mkdir  build                     &&
cd     build                     &&
../src/configure  --prefix=/usr  &&
make_single                      &&
make                             &&
make_normal

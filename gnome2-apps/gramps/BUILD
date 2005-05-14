if [ "${DEVEL}" == "y"  ];then
#  autoreconf
  aclocal                      &&
  automake --add-missing --gnu && 
  autoconf 
fi                             &&

make_single                    &&
default_build                  &&
make_normal

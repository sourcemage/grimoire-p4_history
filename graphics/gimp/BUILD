if [ "$GIMP_DEVEL" = "n" ];then
  if echo $CFLAGS | grep -q pentium-m; then
    CFLAGS="${CFLAGS/-O3/} -Os"
  fi
fi  &&
default_build

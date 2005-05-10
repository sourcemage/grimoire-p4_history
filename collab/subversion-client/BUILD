## conditionally run `make' if SWIG dependency is on
## @usage <1:make target>
function make_if_swig() {
  if echo "$OPTS" | grep -q 'with-swig'; then
    make $1
  fi
}

make_single  &&

if echo $OPTS | grep -q 'without-berkeley-db'; then
  patch -p1 < $SCRIPT_DIRECTORY/swigpyext.patch
fi &&

# strange APR bug exhibiting itself in static builds only
if echo "$OPTS" | grep -q 'enable-all-static'; then
  export LDFLAGS="$LDFLAGS -lpthread"
fi &&

./configure                 \
  --build=$BUILD            \
  --prefix=/usr             \
  --sysconfdir=/etc         \
  --localstatedir=/var      \
  --disable-debug           \
  --disable-mod-activation  \
  --without-apxs            \
  --without-berkeley-db     \
  $OPTS                     &&
make                        &&
make_if_swig  swig-py

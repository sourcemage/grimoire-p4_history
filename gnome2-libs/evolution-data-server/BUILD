if [ "$IPV6" == "y" ] ; then
   OPTS="$OPTS --enable-ipv6=yes"
else
   OPTS="$OPTS --enable-ipv6=no"
fi &&

if [ "$NNTP" == "y" ] ; then
   OPTS="$OPTS --enable-nntp=yes"
else
   OPTS="$OPTS --enable-nntp=no"
fi &&

# packaging error, there's no Camel reference files in the tarball
# we can't simply take this line out, it's going to break configure scripts, so
# we replace it with something innocent instead
sedit 's|docs/reference/camel/Makefile|docs/reference/Makefile|g' configure &&

make_single    &&
default_build  &&
make_normal

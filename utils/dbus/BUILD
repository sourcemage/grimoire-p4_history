if [ "$XMLTYPE" == "y" ]; then
   OPTS="$OPTS --with-xml=libxm"
else
   OPTS="$OPTS --with-xml=expat"
fi                                &&

if [ "$SELINUX" == "y" ]; then
   OPTS="$OPTS --enable-selinux"
fi                                &&

create_account  messagebus        &&
make_single                       &&
default_build                     &&
make_normal

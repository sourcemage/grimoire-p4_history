if [ "$CVS" = "y" ]; then
     sedit "s/root//" autogen.sh
     ./autogen.sh
fi  &&

[[ "$HOST" == x86_64-* ]] && OPTS="$OPTS --disable-mmx"

default_build

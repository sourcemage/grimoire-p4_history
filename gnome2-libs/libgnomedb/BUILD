OPTS="$OPTS --disable-gtk-doc"

case $VERSION in
  0.8.190|0.8.191|0.8.192|0.8.193|0.8.199|0.9.0) 
    cd doc/C
    cp Makefile.in Makefile.in.orig
    grep -v index\.sgml Makefile.in.orig > Makefile.in
    cp Makefile.am Makefile.am.orig
    grep -v index\.sgml Makefile.am.orig > Makefile.am
    cd $SOURCE_DIRECTORY
    ;;
esac

default_build


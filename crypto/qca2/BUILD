PATH="/usr/bin/qt4:$PATH" &&
#export $PATH
sed -i -e "s:bin/qmake:bin/qt4/qmake:g" $SOURCE_DIRECTORY/configure &&
./configure --prefix=/usr --qtdir=/usr/share/qt4 --debug $OPTS  &&
make_single  &&
make &&
make_normal

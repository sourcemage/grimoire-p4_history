mkdir -p /usr/qt  &&

if [ ! -e /usr/qt/lib ]
  then ln -s /usr/lib /usr/qt/lib
fi
if [ ! -e /usr/qt/include ]
  then ln -s /usr/include/qt /usr/qt/include
fi
./configure --with-qtdir=/usr/qt  &&
make

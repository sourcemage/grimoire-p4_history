sedit   's:include/qt3:include/qt:'  qcadlib/src/qcadlib.pro  &&
export  QTDIR=/usr                                            &&
export  QMAKESPEC=${QTDIR}/share/qt/mkspecs/linux-g++         &&

persistent_add  INSTALL  Q_DIR                                &&
INSTALL="install  -o  root  -g  root"                         &&
Q_DIR="/usr/share/qcad"                                       &&

for i in fparser dxflib
do
  echo  $i >> /tmp/test
  cd  $i       &&
  ./configure  &&
  make         &&
  cd  ..
done           &&

echo "before qcadcmd..."
cd qcadcmd    &&
make prepare  &&
cd ..         &&
 
for i in qcadlib qcadcmd qcadactions qcadguiqt qcad
do
  cd  $i                                                       &&
  sedit   's:/include:/include /usr/include/qt :'  src/$i.pro  &&
  make                                                         &&
  cd  ..
done                                                           &&

cd  scripts                                                    &&
bash  ./release_translations.sh

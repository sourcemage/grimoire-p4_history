sedit  "s/read a/a=0/"  scripts/adsl-setup.in
cd  src
./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
cd  ../gui                         &&
make                               &&
prepare_install                    &&
make  install                      &&
cd  ../src

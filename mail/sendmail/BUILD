create_account  smmsp  &&

mkdir  -p          $INSTALL_ROOT/var/spool/mqueue     &&
mkdir  -p          $INSTALL_ROOT/etc/mail             &&
chmod  1777        $INSTALL_ROOT/var/spool/mqueue     &&
chown  smmsp:smmsp $INSTALL_ROOT/var/spool/mqueue     &&
mkdir  -p          $INSTALL_ROOT/usr/doc/sendmail     &&
mkdir  -p          $INSTALL_ROOT/usr/doc/sendmail/cf  &&

pushd  $INSTALL_ROOT/var/spool  &&
ln  -s  mqueue  mail  ||  true  &&
popd                            &&

make  all                             &&
cd  cf/cf                             &&
ln  -s  generic-linux.mc sendmail.mc  &&
make  all

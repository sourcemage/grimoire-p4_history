cd    $SOURCE_DIRECTORY/xc-Trunk/                 &&
make  World  PROJECTROOT=$INSTALL_ROOT/usr/X11R6  &&

if [ "`uname -r | cut -c-3`" == "2.6" ]; then
  cd  $SOURCE_DIRECTORY/drm-Trunk/linux-core
else
  cd $SOURCE_DIRECTORY/drm-Trunk/linux
fi  &&

make

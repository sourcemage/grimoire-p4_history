if [ "$KERN" != "2.4" ]; then
  cd  $SOURCE_DIRECTORY/include  &&
  chmod -R +r *                  &&
  find . -type d -exec chmod +x '{}' ';'
fi  &&

if [[ $(uname -m) == *86_64 ]]; then
  ARCH=x86_64
elif  [[ $(uname -m) == ppc ]]; then
  ARCH=ppc
elif  [[ $(uname -m) == *86 ]]; then
  ARCH=i386
elif  [[ $(uname -m) == *sparc64 ]]; then
  ARCH=sparc64
elif  [[ $(uname -m) == *sparc ]]; then
  ARCH=sparc 
fi

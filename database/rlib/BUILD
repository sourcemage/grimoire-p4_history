(
  sed -i "s/-Werror//" configure.in            &&
  autoconf                                     &&
if spell_installed Python;then
  OPTS="--with-pythonver=`installed_version Python|cut -c-3` $OPTS"
fi						&&
#if spell_installed perl;then
#  PP=`installed_version perl`
#  OPTS="--with-perl-module=/usr/lib/perl5/$PP $OPTS"
#fi                                              &&

echo opts=$OPTS					&&
  default_build

) > $C_FIFO 2>&1

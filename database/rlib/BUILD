(
if spell_installed Python;then
  OPTS="--with-pythonver=`installed_version Python|cut -c-3` $OPTS"
fi						&&
#if spell_installed perl;then
#  OPTS="--use-perl-lib=/usr/lib/perl5/`installed_version perl` $OPTS"
#fi                                              &&

echo opts=$OPTS					&&
  default_build

) > $C_FIFO 2>&1

# temporary fix 
  sed -i "s/-lr//" inputs/odbc/Makefile.am     &&
  sed -i "s/-lr//" inputs/mysql/Makefile.am    &&
  sed -i "s/-lr//" inputs/postgre/Makefile.am  &&

#  sed -i "s/-Werror//;s|/local||;s/dir2/dirm/" configure.in    &&
  sed -i "s/dir2/dirm/" configure.in    &&
  autoreconf                                   &&

if spell_installed Python;then
  OPTS="--with-pythonver=`installed_version Python|cut -c-3` $OPTS"
fi						&&

if spell_installed perl;then
  local PP
  PP=`installed_version perl`
#  OPTS="--with-perl-module=/usr/lib/perl5/site_perl/${PP}/i686-linux-thread-multi $OPTS"
#  OPTS="--with-perl-include=/usr/lib/perl5/${PP}/i686-linux-thread-multi/CORE $OPTS"
  OPTS="--with-perl-module=/usr/lib/perl5/site_perl/${PP}/*-linux-* $OPTS"
  OPTS="--with-perl-include=/usr/lib/perl5/${PP}/*-linux-*/CORE $OPTS"
fi                                              &&
#  message opts=$OPTS &&
  default_build

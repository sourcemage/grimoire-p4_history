if [ "$MOD_PERL" == '2' ]; then
  OPTIONS="MP_APXS=$(which apxs)"
fi &&
perl  Makefile.PL  NO_HTTPD=1  $OPTIONS  &&
make

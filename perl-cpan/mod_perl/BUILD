if [ "$MOD_PERL" == '2' ]; then
  OPTIONS="MP_APXS=$(which apxs) MP_APR_CONFIG=$(which apr-config)"
fi &&
perl  Makefile.PL  NO_HTTPD=1  $OPTIONS  &&
make

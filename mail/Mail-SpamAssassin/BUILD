if  [  "$MAILSPAM_SSL"  =  "y"  ];  then
  CFLAGS="$CFLAGS  -DSPAMC_SSL"
fi  &&

echo "\n" | perl  Makefile.PL  RUN_RAZOR2_TESTS=y RUN_RAZOR1_TESTS=y  &&
make

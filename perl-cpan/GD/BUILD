(
  sedit  's/^my \$JPEG/my $JPEG  = 1; # &/' Makefile.PL  &&
  sedit  's/^my \$TTF/my $TTF   = 1; # &/'  Makefile.PL  &&
  sedit  's/^my \$XPM/my $XPM   = 1; # &/'  Makefile.PL  &&
  sedit  's/^my \$GIF/my $GIF   = 0; # &/'  Makefile.PL  &&
  perl                                      Makefile.PL  &&
  make                                                   &&
  prepare_install                                        &&
  make    install

) > $C_FIFO 2>&1

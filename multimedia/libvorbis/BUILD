cp        configure      configure.old
cp        configure.in   configure.in.old

sed  "s/-O20 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char//"                                      <  configure.old     |
sed  "s/-Wall -W -pg -g -O20 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char -fno-inline -static//"  >  configure

sed  "s/-O20 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char//"                                      <  configure.in.old  |
sed  "s/-Wall -W -pg -g -O20 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char -fno-inline -static//"  >  configure.in

default_build

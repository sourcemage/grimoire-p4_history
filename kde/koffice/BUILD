#gcc3.3 bugfix
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
sedit "s/-ansi//g" configure &&
sedit "s/-pedantic//g" configure 
fi                                                           &&
OPTS="--disable-debug ${OPTS}"                               &&
default_build

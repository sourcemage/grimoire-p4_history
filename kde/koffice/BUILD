#gcc3.3 bugfix
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
sedit "s/-ansi//g" configure &&
sedit "s/-pedantic//g" configure 
fi                                                           &&

source  $SCRIPT_DIRECTORY/../KDE_BUILD

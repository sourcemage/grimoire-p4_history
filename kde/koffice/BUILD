# security fix
patch -p1 < $SPELL_DIRECTORY/post-1.3.5-koffice.diff &&

#gcc3.3 bugfix
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
sedit "s/-ansi//g" configure &&
sedit "s/-pedantic//g" configure 
fi                                                           &&

source  $SCRIPT_DIRECTORY/../KDE_BUILD

OPTS="$OPTS  $KDEPIM_EXCHANGE"  &&
# security fix
cd kresources/kolab &&
patch -p0 < $SPELL_DIRECTORY/kdepim-fix-imap-resource-type.diff &&
cd ../..           &&
source  $SECTION_DIRECTORY/KDE_BUILD

cp  $SPELL_DIRECTORY/povray.ini $SOURCE_DIRECTORY &&  #  because we change PREFIX to /usr
sedit  "s/DEFAULT_OUTPUT_FORMAT  't'/DEFAULT_OUTPUT_FORMAT  'n'/g"                                                  src/config.h  &&
sedit  "s/#error.*//g"                                                                                              src/optout.h  &&
sedit  "s/FILL IN NAME HERE........................./Source Mage GNU\/Linux, email seth@tautology.org with bugs/g"  src/optout.h  &&

./configure  --prefix=/usr  \
             $OPTS          &&
make                        &&
make    check 

(

./configure  &&
# (/), ($) and (*) are special characters that need to be escaped with a \
#  a period (.)is a special character that needs to be escaped 
# in the search field only.
# $ marks end of line.
# the special character (&) repeats the search string.
# the special character (^) matches the string from the begining of a line.

sedit "s/"cx"/"dx"/g" src/engine/i386.c
sedit "s/penium/pentium/" src/engine/i386.c
sedit "s/\/usr\/local/\/usr/" Makefile

make  all                                   &&
prepare_install                             &&
make install                                

) > $C_FIFO 2>&1

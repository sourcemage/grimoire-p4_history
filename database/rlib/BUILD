(
echo opts=$OPTS
# to fix Python error
#  sedit "s/-Werror//" configure.in		 &&
  sedit "s/-Werror//" configure			 &&
#autoupdate &&
#  autoconf					 &&
#  patch -p0 < $SPELL_DIRECTORY/xml.diff libsrc/parsexml.c	&&
  default_build

) > $C_FIFO 2>&1

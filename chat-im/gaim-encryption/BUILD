### had to cook up some pkg-config files for nss and nspr 
if spell_installed nss ; then
  export PKG_CONFIG_PATH="/usr/include/nss:/usr/include/nspr" 
fi                                              &&

if  [  "$CVS"  ==  "y"  ] ;  then ./autogen.sh; fi   &&

./configure  --build=$BUILD                     \
             --prefix=/usr                      \
             --sysconfdir=/etc                  \
             --localstatedir=/var               \
             $OPTS                              &&
make

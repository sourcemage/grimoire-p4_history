
# if  [  "$CVS"  ==  "y"  ] ;  then ./autogen.sh; fi   &&
if [  "$CVS" == "y"  ] ; then patch -p1 < $SCRIPT_DIRECTORY/gaim-rss-project-binesh.patch; fi  &&

./configure  --build=$BUILD                     \
             --prefix=/usr                      \
             --sysconfdir=/etc                  \
             --localstatedir=/var               \
             --with-gaim=/usr/include/gaim      \
             $OPTS                              &&
make

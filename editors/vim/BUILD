./configure  --build=$BUILD                        \
             --prefix=$INSTALL_ROOT/usr            \
             --sysconfdir=$INSTALL_ROOT/etc        \
             --mandir=$INSTALL_ROOT/usr/share/man  \
             --localstatedir=/var                  \
             --enable-gui=$GUI                     \
             $OPTS                 &&
sedit '/shUntil\|link shRepeat/{
     /shUntil/N
     /^/i\
     if exists("b:is_kornshell") || exists("b:is_bash")
     p
     /$/i\
     endif
     d
     }' "runtime/syntax/sh.vim"    &&
make

(

  ./configure \
     --build=$BUILD       \
     --prefix=/usr        \
     --sysconfdir=/etc    \
     --localstatedir=/var \
     $OPTS                &&
  make                    &&

# We need this directory in the path for the following utilities:
# cut, dirname, tail, and uniq
  export PATH="$PATH:$SOURCE_DIRECTORY/src" &&

  prepare_install &&
  make    install

) >$C_FIFO 2>&1

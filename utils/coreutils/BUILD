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

# Move files as required by FHS
  mkdir -p /bin &&
  pushd /usr/bin &&
  ./mv \
    chgrp \
    chmod \
    chown \
    cp \
    dd \
    df \
    ln \
    ls \
    mkdir \
    mknod \
    mv \
    rm \
    rmdir \
    sync \
    date \
    echo \
    false \
    groups \
    pwd \
    stty \
    true \
    uname \
    hostname \
    su \
    cat \
    head \
    tail \
    /bin/ &&
  popd

) >$C_FIFO 2>&1

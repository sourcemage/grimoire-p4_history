create_account  backup      &&

OPTS="$OPTS                 \
      $AMANDA_CLIENT        \
      $AMANDA_HOSTS         \
      $AMANDA_BUFFER        \
      $AMANDA_FQDN          \
      --with-db=$AMANDA_DB  \
      --with-user=backup    \
      --with-group=backup"  &&

default_build

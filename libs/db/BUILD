(

  cd  build_unix &&
  ../dist/configure  --prefix=/usr       \
                     --build=$BUILD      \
                     --enable-dynamic    \
                     --enable-compat185  \
                     --enable-cxx        &&

#                    --enable-java       \

  make                                   &&
  prepare_install                        &&
  make    install
#                        &&
#  rm    -rf     /usr/docs                &&
#   rm    -f      /usr/include/db3         &&
#   ln    -s   .  /usr/include/db3

) > $C_FIFO 2>&1

(

  message  "${MESSAGE_COLOR}If this spell complains that e2fsprogs"
  message  "is noot installed simply: cast e2fsprogs dump${DEFAULT_COLOR}"

  ./configure  --prefix=/usr       \
               --enable-largefile  \
               --enable-rmt        &&
  make                             &&
  prepare_install                  &&
  make    install                  &&
  message  "`cat  $SCRIPT_DIRECTORY/message.txt`"  

) > $C_FIFO 2>&1

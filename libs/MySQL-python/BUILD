(
#current mysql spell does not build a thread-safe-client-library 
#this can be fixed (after investigation) but this fixes the immediate problem
  sedit s"/thread_safe_library = YES/thread_safe_library = NO/g" setup.py && 
  python  setup.py  build     &&
  prepare_install             &&
  python  setup.py  install

) > $C_FIFO 2>&1

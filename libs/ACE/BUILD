(
  export ACE_ROOT=/usr/src/ACE_wrappers         
  export LD_LIBRARY_PATH=$ACE_ROOT/ace:$LD_LIBRARY_PATH

  prepare_install                               &&
  $SCRIPT_DIRECTORY/myacemaker auto

) > $C_FIFO 2>&1

(
  export ACE_ROOT=/usr/src/ACE_wrappers         
  export LD_LIBRARY_PATH=$ACE_ROOT/ace:$LD_LIBRARY_PATH
  # insert custom Makefile that removes tests building
  # for gperf.
  #cp -rv $SCRIPT_DIRECTORY/Makefile.gperf       \
  #       $SOURCE_DIRECTORY/apps/gperf/Makefile  &&
  prepare_install                               &&
  $SCRIPT_DIRECTORY/myacemaker auto

) > $C_FIFO 2>&1

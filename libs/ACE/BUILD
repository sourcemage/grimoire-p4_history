(
  export ACE_ROOT=/usr/lib/ACE
  export TAO_ROOT=/usr/lib/ACE/TAO
  export LD_LIBRARY_PATH=$ACE_ROOT/ace:$LD_LIBRARY_PATH
  MY_ACE_CONFIG=config-linux.h
  MY_ACE_GNU_MACROS=platform_linux.GNU

  if [ -d $ACE_ROOT ]
  then
    rm -rf $ACE_ROOT
    mkdir $ACE_ROOT
  else
    mkdir $ACE_ROOT
  fi

  # setting up the configuration for SMGL.
	#
  cd $SOURCE_DIRECTORY/ace
	echo  "Creating link config.h for ${MY_ACE_CONFIG} in directory `pwd` ..."
  if [ -e config.h ]
  then
    rm ./config.h
    ln -s ${MY_ACE_CONFIG} config.h
  else
   ln -s ${MY_ACE_CONFIG} config.h
  fi
  echo  ""

  # setting up the includes for SMGL.
	#
  cd $SOURCE_DIRECTORY/include/makeinclude
  echo  "Creating link platform_macros.GNU for ${MY_ACE_GNU_MACROS}"
  echo  "in directory `pwd` ..."
  if [ -e platform_macros.GNU ]
  then
    rm ./platform_macros.GNU
    ln -s ${MY_ACE_GNU_MACROS} platform_macros.GNU
  else
    ln -s ${MY_ACE_GNU_MACROS} platform_macros.GNU
  fi
  echo  ""

  echo  "Making ACE now..."
  echo  ""
	
  prepare_install                     &&
  mv $SOURCE_DIRECTORY/* $ACE_ROOT    &&
  cd $ACE_ROOT/ace                    &&
  make                                &&
  cd $ACE_ROOT/tests                  &&
  make                                &&
  cd $ACE_ROOT/apps/gperf             &&
  make                                &&

# To be sorted out in the future, right now
# this installs over 2 GB on libs!!! Not here...
#
#  echo  ""                            &&
#  echo  "Making TAO now..."           &&
#  echo  ""                            &&
#  cd $TAO_ROOT                        &&
#  make                                &&

# saving some space by removing TAO dir
#
  rm -rf $TAO_ROOT                    &&

  echo  ""                            &&
  echo  "***** End of installation, get ready to ACE!!! *****"  &&
  echo  ""
	  
) > $C_FIFO 2>&1

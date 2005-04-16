#------------------------------------------------------
##
## Force the system to use gcc33
##
## I really don't understand what this code does.
##
## Copied from libgcc2 from sorcery
##
##
#------------------------------------------------------


#---------------------------------------------------------------------
## @param new path to add
## @param old path
## @Stdout new path
## Echos the old path with new path prepended, separated with a ':'
#---------------------------------------------------------------------
function gcc33_prepend_path()  {

  if    test  -z  $2
  then  echo $1
  else  echo $1:$2
  fi

}

#---------------------------------------------------------------------
## @param path
##
## Alters the environment so that gcc33 will be used for compiling and
## building spells when the "gcc" command is used.
##
#---------------------------------------------------------------------
function gcc33_add_paths()  {

  export  PATH=$(  gcc33_prepend_path  $1/bin  $PATH  )
  export  LD_LIBRARY_PATH=$(  gcc33_prepend_path  $1/lib  $LD_LIBRARY_PATH  )
  export  LD_RUN_PATH=$(  gcc33_prepend_path  $1/lib  $LD_RUN_PATH  )
  export  INFOPATH=$(  gcc33_prepend_path  $1/info  $INFOPATH  )
  export  CPPFLAGS="-I $1/include  $CPPFLAGS"

}

gcc33_add_paths  /opt/gcc33
echo  "Using gcc version: `gcc  -dumpversion`"

#---------------------------------------------------------------------
##
## End Messy USEGCC33 hack
##
#---------------------------------------------------------------------

create_account sfs

# needed for gcc 3.3
sedit  "s:-Werror::"  configure  &&
default_build

(

  pinfo() { echo -e "\n${SPELL_COLOR}${*}${DEFAULT_COLOR}\n" ; }
  mkdep()
  {
    local file="$RD/%$1/runlevel.config"

    rm -f $file

    if [ "$2" ] ; then
      echo "Making runlevel $1 depend on runlevel $2"
      echo "NEEDS=%$2" > $file
    else
      echo "NEEDS=" > $file
    fi
  }

  FD=$SCRIPT_DIRECTORY/files    # Files Directory
  ID=/etc/init.d                # Init Dir
  RD=/etc/init.d/runlevels      # Runlevels Dir

  prepare_install                                             &&

  pinfo "Creating directories..."                             &&

  mkdir  -pv  $RD/%S  $RD/%1  $RD/%2  $RD/%3  $RD/%4  $RD/%5  &&
  mkdir  -pv  /etc/sysconfig                                  &&

  pinfo "Installing files..."                                 &&

  install  -v  -m 644  $FD/auto_init        $ID/              &&
  install  -v  -m 754  $FD/rc               $ID/              &&
  install  -v  -m 644  $FD/smgl_functions   $ID/              &&
  install  -v  -m 644  $FD/smgl_init        $ID/              &&
  install  -v  -m 644  $FD/smgl_runlevel    $ID/              &&

  # Some non-directory based runlevels
  install  -v  -m 754  $FD/%*               $RD/              &&

  pinfo "Installing facility and init configfiles..."         &&

  _init_install_conf_files facilities init                    &&

  pinfo "Creating runlevel dependency files..."               &&

  mkdep S                                                     &&
  mkdep 1 S                                                   &&
  mkdep 2 1                                                   &&
  mkdep 3 2                                                   &&
  mkdep 4 3                                                   &&
  mkdep 5 4                                                   &&

  pinfo "Other stuff..."                                      &&

  # Yeah, I know
  ln  -sfv  /bin/true  $RD/rc                                 &&

  # LILO uses the auto runlevel when it doesn't encounter any user input
  ln  -sfv  /etc/init.d/runlevels/%default  /etc/init.d/runlevels/%auto

) > $C_FIFO 2>&1

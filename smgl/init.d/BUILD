(

  pinfo() { echo -e "\n${SPELL_COLOR}${*}${DEFAULT_COLOR}\n" ; }
  mkdep()
  {
    local file="$RD/%$1/runlevel.config"

    rm -f $file

    if [ "$2" ] ; then
      echo "Making runlevel $1 depend on runlevel $2"
      echo "NEEDS=%$2" | cp /dev/stdin $file
    else
      echo "NEEDS=" | cp /dev/stdin $file
    fi
  }

  FD=$SCRIPT_DIRECTORY/files    # Files Directory
  ID=${INSTALL_ROOT}/etc/init.d                # Init Dir
  RD=${INSTALL_ROOT}/etc/init.d/runlevels      # Runlevels Dir

  prepare_install                                             &&

  pinfo "Creating directories..."                             &&

  mkdir  -pv  $RD/%S  $RD/%1  $RD/%2  $RD/%3  $RD/%4  $RD/%5  &&
  mkdir  -pv  ${INSTALL_ROOT}/etc/sysconfig                                  &&

  pinfo "Installing files..."                                 &&

  install  -v  -m 644  $FD/auto_init        $ID/              &&
  install  -v  -m 754  $FD/rc               $ID/              &&
  install  -v  -m 644  $FD/smgl_functions   $ID/              &&
  install  -v  -m 644  $FD/smgl_init        $ID/              &&
  install  -v  -m 644  $FD/smgl_telinit     $ID/              &&
  install  -v  -m 644  $FD/smgl_runlevel    $ID/              &&

  # Some non-directory based runlevels
  # note, these are stored as _<script-name> and 
  #  copied to %<script-name>
  install  -v  -m 754  $FD/_default         $RD/%default      &&
  install  -v  -m 754  $FD/_rescue          $RD/%rescue       &&
  install  -v  -m 754  $FD/_single          $RD/%single       &&

  pinfo "Installing facility, shutdown, and init configfiles..."  &&

  _init_install_conf_files facilities shutdown init           &&

  pinfo "Creating runlevel dependency files..."               &&

  mkdep S                                                     &&
  mkdep 1 S                                                   &&
  mkdep 2 1                                                   &&
  mkdep 3 2                                                   &&
  mkdep 4 3                                                   &&
  mkdep 5 4                                                   &&

  pinfo "Other stuff..."                                      &&

  # Proper shutdown procedure
  ln -fsv ${INSTALL_ROOT}/etc/sysconfig/shutdown ${INSTALL_ROOT}/etc/shutdown.conf          &&

  # Yeah, I know
  ln  -sfv  ${INSTALL_ROOT}/bin/true  $RD/rc                                 &&

  # LILO uses the auto runlevel when it doesn't encounter any user input
  ln  -sfv  ${INSTALL_ROOT}/etc/init.d/runlevels/%default  ${INSTALL_ROOT}/etc/init.d/runlevels/%auto

) > $C_FIFO 2>&1

MakeFileFirebirdWritable ()
{
    FileName=$1			
    touch $FileName
    chown $RunUser.$RunUser $FileName
    chmod 0644 $FileName
}


(
# superserver install does not need services or xinet.d
#  create_account firebird
#  PREFIX=/opt/firebird		
  PREFIX=/usr/firebird		
# apparently firebird == 84 ???
  groupadd -g 84 -o firebird
#  2>/dev/null
#  useradd firebird -g firebird  2>/dev/null
#  useradd -o  -M -d $PREFIX -s /bin/false \
  useradd -o  -M -d $PREFIX -s /bin/bash \
          -c "Firebird Database Administrator"\
	  -g firebird -u 84 firebird 


#  sedit "s/yes/no/" \
#src/install/arch-specific/linux/misc/rc.config.firebird.in	&&
  sedit "s/-O3 -march=i586 -mcpu=i686/$CFLAGS/;s/-fno-builtin//" \
	builds/posix/prefix.linux		&&
if [ ! -z "$SS" ]
then
  OPTS=" --enable-superserver $OPTS"
fi						&&
  ./autogen.sh 			\
	--prefix=$PREFIX 	\
        --sysconfdir=/etc     	\
        --localstatedir=/var  	\
	--with-editline		\
	$OPTS					&&

  make						&&
  
  cd $SOURCE_DIRECTORY/gen/firebird		&&

# preserve some existing files
#  if [ -f /usr/firebird/security.fdb ]; then
#    cp /usr/firebird/security.fdb ./
#  fi						&&
  if [ -f /etc/firebird.conf ]; then
    cp /etc/firebird.conf ./misc
  fi						&&
#  if [ -f /usr/firebird/SYSDBA.password ]; then
#    cp /usr/firebird/SYSDBA.password ./
#  else
#  fi						&&
  
  cd $SOURCE_DIRECTORY				&&
  

  prepare_install				&&

#default install
#  make install					&&
#their install puts script in wrong location and leaves server running
# let's stop it and remove the script
#  /etc/init.d/firebird stop			&&
#  rm -f /etc/init.d/firebird			

#try our own install

  mkdir -p $PREFIX				&&

# firebird still expects a /opt/firebird directory
#mkdir -p /opt					&&
#ln -sf $PREFIX /opt				&&

# use our version of the scripts
  cd $SOURCE_DIRECTORY/gen/firebird		&&
  cp $SPELL_DIRECTORY/scripts/* ./bin 		&& 

  cd bin					&&
  echo changing names to avoid conflicts with unixODBC&&
  for F in `ls isql*`				
  {
    echo $F ==\> fb${F}
    mv $F fb${F}
  }						&&

# Create the fbmgr shell script. (only needed by SS)
#  if  [ ! -z "$SS" ]
#  then
#    cat > fbmgr <<EOF
##!/bin/sh
#FIREBIRD=$PREFIX
#export FIREBIRD
#exec \$FIREBIRD/bin/fbmgr.bin \$@
#EOF						
#  fi						&&

  cd ..						&&
# make a spare copy of security.fdb - for testing
  cp security.fdb security.fdb.spare		&&

# now copy everything
  cp -r ./* $PREFIX/				&&

# make links to programs
  for F in `ls $PREFIX/bin/{f,g}*`
  {
    ln -sf $F /usr/bin/
  }						&&

# make links to libraries
  for F in `ls $PREFIX/lib/`
  {  
    ln -sf $PREFIX/lib/$F /usr/lib/
  }						&&
 
  ln -sf $PREFIX/include /usr/include/firebird	&&
  cp misc/firebird.conf /etc			&&


# the remainingcode is copied from their postinstall.sh
    IBRootDir=$PREFIX				&&
    IBBin=$IBRootDir/bin			&&
#    RunUser=root
    RunUser=firebird				&&

# these are not needed here
#    DBAPasswordFile=$IBRootDir/SYSDBA.password	&&
#    export IBRootDir				&&
#    export IBBin				&&
#    export RunUser				&&
#    export DBAPasswordFile			&&
    # Add entries to host.equiv & hosts.allow files
#to be done

# For security reasons initially force all root:root non-writable
    chown -R root.root $IBRootDir		&&
    chmod -R uga-w $IBRootDir			&&

    # Prepare bin
    cd $IBBin					&&


# Everyone may execute clients
  chmod 0555 *				&&

# Shell scripts changing security attributes are for root only
  chmod 0500 *.sh				&&
  if [ ! -z "$SS" ]
  then 
    echo superserver
    # These two should only be executed by firebird user.
    #fbservices=fbguard fbserver		&&
    #chown $RunUser.$RunUser $fbservices	&&
    #chmod 0544 $fbservices			&&
  fi						&&

# Lock files
    cd $IBRootDir				&&

    for i in isc_init1 isc_lock1 isc_event1 isc_guard1
      do
        FileName=$i.`hostname`
	MakeFileFirebirdWritable $FileName
      done					&&


#    touch firebird.log				&&
    MakeFileFirebirdWritable firebird.log	&&

    # Security database
    # Nobody besides firebird permitted to even read this file
    chown $RunUser.$RunUser security.fdb	&&
    chmod 0600 security.fdb			&&

    # make examples writable by firebird
    for F in examples/v5/*.fdb		
      do
	MakeFileFirebirdWritable $F
      done

  
) > $C_FIFO 2>&1

(

# function to generate proper symlinks for runlevels
linkscript ()
{
    truncname=$(echo $1 | cut -d. -f1)
    for action in SGL-START SGL-STOP
      do
      for level in $(grep "# $action" $initdir/$1 | cut -d: -f2)
	do
	pri=$(grep "# $action" $initdir/$1 | cut -d: -f3)
	if [ ! -f /etc/rc$level.d/*$truncname* ]; then
	    ln -s $initdir/$1 /etc/rc$level.d/$pri$truncname
	else
	    pri2=$(ls /etc/rc$level.d/*$truncname* | sed s/$truncname// | sed s/\.sh// | cut  -d/ -f4)
	    if [ ! $pri = $pri2 ]; then
		rm -f /etc/rc$level.d/*$truncname*
		ln -s $initdir/$1 /etc/rc$level.d/$pri$truncname
	    fi
	fi
      done
    done
}

# Function to backup existing scripts and install updated ones 
installscript ()
{
# setup invironmental stuff
    if [ $1 = functions ]; then
	prm=644
    else
	prm=755
    fi
# I want to back up the old scripts, I'm just that kinda guy, I guess.
# Check to see the damn thing is there first. Thanks Treeve!
    if [ -e /etc/init.d/$1 ]; then
       mv /etc/init.d/$1 /etc/init.d/$1.$savetime
    fi
    install  -m  $prm  $SCRIPT_DIRECTORY/scriptdir/$1  /etc/init.d
    if [ ! $1 = functions ]; then
	linkscript $1
    fi  
}

# prepare_install removes scripts that are not in the install que 
# but were installed previously by init.d; this is a bad thing (tm)
# so "just say no" to prepare_install && for now

# Install selected scripts
# the scriptque gets built in CONFIGURE
initdir=/etc/init.d
savetime=$(date +%Y%m%d%k%M)

# let's do the installation this way for now.I'll add the check of 
# whether the program the script is associated with is installed
# to the CONFIGURE script.

scriptque=$(cat $SCRIPT_DIRECTORY/scriptque.temp)
for script in $scriptque; do
  installscript $script
done
# clean up .temp files
scratch_list=$(ls $SCRIPT_DIRECTORY | grep .temp)
for scratch_file in $scratch_list; do
    rm -f $SCRIPT_DIRECTORY/$scratch_file
done

) > $C_FIFO 2>&1

(

# function to generate proper symlinks for runlevels
linkscript ()
{
    truncname=$(echo $init_script | cut -d. -f1)
    for action in SGL-START SGL-STOP
      do
      for level in $(grep "# $action" $initdir/$init_script | cut -d: -f2)
	do
	pri=$(grep "# $action" $initdir/$init_script | cut -d: -f3)
	if [ ! -f /etc/rc$level.d/*$truncname* ]; then
	    ln -s $initdir/$init_script /etc/rc$level.d/$pri$truncname
	else
	    pri2=$(ls /etc/rc$level.d/*$truncname* | sed s/$truncname// | sed s/\.sh// | cut  -d/ -f4)
	    if [ ! $pri = $pri2 ]; then
		rm -f /etc/rc$level.d/*$truncname*
		ln -s $initdir/$init_script /etc/rc$level.d/$pri$truncname
	    fi
	fi
      done
    done
}

# Function to backup existing scripts and install updated ones 
installscript ()
{
# setup invironmental stuff
    if [ $init_script = functions ]; then
	prm=644
    else
	prm=755
    fi
# I want to back up the old scripts, I'm just that kinda guy, I guess.
# Check to see the damn thing is there first. Thanks Treeve!
    if [ -e /etc/init.d/$init_script ]; then
       mv /etc/init.d/$init_script /etc/init.d/$init_script.$savetime
    fi
    install  -m  $prm  $SCRIPT_DIRECTORY/scriptdir/$init_script  /etc/init.d
    if [ ! $init_script = functions ]; then
	linkscript $init_script
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
for init_script in $scriptque; do
  installscript $init_script
done
# clean up .temp files
scratch_list=$(ls $SCRIPT_DIRECTORY | grep .temp)
for scratch_file in $scratch_list; do
    rm -f $SCRIPT_DIRECTORY/$scratch_file
done

) > $C_FIFO 2>&1

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
	if [ ! -f /etc/rc$level.d/*$truncname ]; then
	    ln -s $initdir/$init_script /etc/rc$level.d/$pri$truncname
	else
	    pri2=$(ls /etc/rc$level.d/*$truncname | sed s/$truncname// | sed s/\.sh// | cut  -d/ -f4)
	    if [ ! $pri = $pri2 ]; then
		rm -f /etc/rc$level.d/*$truncname
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
    if [ -e /etc/init.d/$init_script ]; then
    
	mv -f /etc/init.d/$init_script /etc/init.d/$init_script.$savetime
    fi
    install  -m  $prm  $SCRIPT_DIRECTORY/scriptdir/$init_script  /etc/init.d
    if [ ! $init_script = functions ]; then
	linkscript $init_script
    fi  
}

# this is needed to clean up old links to mount.sh after update
cleanup_old()
{
    for runlvl in 0 1 2 3 4 5 6 S; do
	mnttst=$(ls /etc/rc$runlvl.d | grep mount.sh$)
	if [ -n "$mnttst" ]; then
	    test2=$(ls /etc/rc$runlvl.d | grep mount$)
	    if [ -n "$test2" ]; then
		rm -f /etc/rc$runlvl.d/$mnttst
	    fi
	fi
    done
}
# prepare_install removes scripts that are not in the install que 
# but were installed previously by init.d; this is a bad thing (tm)
# so "just say no" to prepare_install && for now

# Install selected scripts
# the scriptque gets built in CONFIGURE
initdir=/etc/init.d
savetime=$(date +%Y%m%d%k%M)

# strip out the quotes in previous output so it's usable
sedit "s/\"//g" $SCRIPT_DIRECTORY/scriptque.temp    
scriptque=$(cat $SCRIPT_DIRECTORY/scriptque.temp)
for init_script in $scriptque; do
    installscript $init_script
done
# clean up .temp files
scratch_list=$(ls $SCRIPT_DIRECTORY | grep .temp)
for scratch_file in $scratch_list; do
    rm -f $SCRIPT_DIRECTORY/$scratch_file
done
# clean up old mount.sh files
cleanup_old

) > $C_FIFO 2>&1

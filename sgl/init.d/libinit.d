# functions for init.d configure
#

# This makes the headers for the device files
cat_headers () 
{
    cat > $netdir/$nicfile <<EOF
# config file for $nicfile
# use dynamic or static for MODE=
# dynamic and static both require:
# MODULE= kernel module for $nicfile
# static requires the following in addition:
# IP= ip address of $nicfile (if you have one, MODE=static)
# BROADCAST= broadcast address
# NETMASK= netmask address
# GATEWAY= gateway address
EOF
}


# this function builds a nicfile from user input
make_nicfile () 
{
    cat_headers
    unset_modvars
    for info in MODULE MODE IP BROADCAST NETMASK GATEWAY; do
# Do I need to add help explaining what each is? This would work:
# dialog --backtitle "$sgl_logo" --textbox $SCRIPT_DIRECTORY/helpdir/$info.txt 0 0	
	dialog --backtitle "$sgl_logo" --nocancel --inputbox\
	    "What does ethernet card $nicfile use for $info?" 0 0 2>$SCRIPT_DIRECTORY/infodata.temp
	infodata=$(cat $SCRIPT_DIRECTORY/infodata.temp)
	echo $info=$infodata >>$netdir/$nicfile
    done
}

# This function takes care of possible naming conflicts while
# making a nicfile then calls function make_nicfile
setup_nicfile () 
{
    dialog --backtitle "$sgl_logo"  --yesno\
	"Do you need to setup a network card?" 0 0
    ans=$?
    while [ "$ans" = "0" ]; do
	dialog --backtitle "$sgl_logo"  --inputbox\
	    "What does your ethernet card use for device designation?" 0 0 2>infodata.temp
	nicfile=$(cat infodata.temp)
	if [! -f $netdir/$nicfile ]; then 
	    make_nicfile
	else
# if the nicfile already exists, this should cover all the bases
#
	    ans2=y
	    while [ $ans2 = y ]; do
		dialog --backtitle "$sgl_logo" --nocancel --menu\
		    "There currently exists a file for $nicfile,\
 what do you want to do with it?" 0 0 0\
		    "Replace" "Backup the existing $nicfile file and rewrite it."\
		    "Edit" "Edit the existing $nicfile file."\
		    "View" "View the existing $nicfile file."\
		    "Finished" "I don't need to change this file"\
		    2>$SCRIPT_DIRECTORY/nicexists.temp
		nic_test=$(cat $SCRIPT_DIRECTORY/nicexists.temp)
		case $nic_test in
		    Replace )
			ans2=n
			mv $netdir/$nicfile $netdir/$savetime.$nicfile
			make_nicfile
			;;
		    Edit )
			ans2=y
			edit_file $netdir/$nicfile
			;;
		    View )
			ans2=y
			dialog --backtitle "$sgl_logo" --textbox $netdir/$nicfile 0 0
			;;
		    Finished )
			ans2=n
			;;
		    * )
			ans2=y
			dialog --backtitle "$sgl_logo" --msgbox\
			    "You must select an option!" 0 0
			;;
		esac
	    done
	fi
	dialog --backtitle "$sgl_logo"  --yesno\
	    "do you have another network card you need to setup?" 0 0
	ans=$?
    done
}

# just to be on the safe side, this function unsets
# the nic's variables
unset_modvars ()
{
    for modvars in MODE MODULE IP BROADCAST NETMASK GATEWAY; do
	unset $modvars
    done
}

# this should only be needed for the initial change to the 
# new networking schema; the information should be present
# or the user should know what it is.
transfer_data ()
{
    unset_modvars
    IP=$(grep ^IP= $initdir/$nicfile)
    if  [ -z "$IP" ]; then
	MODE=dynamic
    else
	MODE=static
    fi
    MODULE=`grep ^MODULE= $initdir/$nicfile`
    BROADCAST=`grep ^BROADCAST= $initdir/$nicfile`
    NETMASK=`grep ^NETMASK= $initdir/$nicfile`
    GATEWAY=`grep ^GATEWAY= $initdir/$nicfile`
    dialog --backtitle "$sgl_logo"  --yesno\
	"Does the device $nicfile have the following attributes?\n
        "$MODULE"\n
          "$MODE"\n
       "$IP"\n
     "$BROADCAST"\n
      "$NETMASK"\n
      "$GATEWAY"" 0 0
    retval=$?
    if [ "$retval" = "0" ]; then 
	cat_headers
	for info in MODULE MODE IP BROADCAST NETMASK GATEWAY; do
	    cat $info >>$netdir/$nicfile
	done
    else
	setup_nicfile
    fi
}

# mostly for new and clean installs
install_networking ()
{
    if [ ! -d /etc/sysconfig/network ]; then
	if [ ! -d /etc/sysconfig ]; then
	    mkdir /etc/sysconfig
	fi
	mkdir /etc/sysconfig/network
    fi
    if [ -e $initdir/networking.sh ]; then
	nicfile=`grep ^DEVICE= $initdir/networking.sh | cut -d= -f2`
	if [ -n "$nicfile" ]; then
	    dialog --backtitle "$sgl_logo" --yesno\
		"Do you want to attempt to use your existing networking data to\
 create the necessary network files for device $nicfile?" 0 0 
	    retval=#?
	    if [ "$retval" = "0" ]; then 
		if [ ! -f $netdir/$nicfile ]; then
		    transfer_data
		else
		    dialog --backtitle "$sgl_logo" --yesno\
			"You already have a $netdir/$nicfile file./n\
 This is what it currently contains: /n\
 `sed 's/^.*$/&\\\n/' $netdir/$nicfile` /n Do you want to keep this one?" 0 0 
		    retval=#?
		    if [ "$retval" = "1" ]; then
# add the date to the front of the network device file so networking.sh
# doesn't try and load it but we don't delete anything.
			mv $netdir/$nicfile /$netdir/$savetime.$nicfile
			transfer_data
		    else
			dialog --backtitle "$sgl_logo" --msgbox\
			    "You will need to ensure that your $netdir/$nicfile file is in accordance\
 with the SGL networking.sh script or you will have difficulties starting and stopping your networking."
		    fi
		fi
	    else
		dialog --backtitle "$sgl_logo" --msgbox\
		    "We need to get some information on your network to setup a ethernet card." 0 0
		setup_nicfile
	    fi
	else
	    dialog --backtitle "$sgl_logo" --msgbox\
		"We need to get some information on your network to setup a ethernet card." 0 0
	    setup_nicfile
	fi
    fi
}

#!/bin/sh
#
#  Install script for Firebird database engine
#  http://www.firebirdsql.org
#
#  This library is part of the Firebird project
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#  You may obtain a copy of the Licence at
#  http://www.gnu.org/licences/lgpl.html
#  
#  As a special exception this file can also be included in modules
#  with other source code as long as that source code has been 
#  released under an Open Source Initiative certificed licence.  
#  More information about OSI certification can be found at: 
#  http://www.opensource.org 
#  
#  This module is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Lesser General Public Licence for more details.
#  
#  This module was created by members of the firebird development 
#  team.  All individual contributions remain the Copyright (C) of 
#  those individuals and all rights are reserved.  Contributors to 
#  this file are either listed below or can be obtained from a CVS 
#  history command.
# 
#  Created by:  Pavel Cisar <pcisar@ibphoenix.com)
# 
#  Contributor(s):
#  
#  Features:
#  - [Default] Interactive installation
#  - All-in-one install: Classic or Super Server or Client only
#  - Optional packages: examples, doc, libraries, additional tools
#  - Automatic installation mode
#  - Detects previous installation of InterBase or Firebird 1.0/1.5
#  - Retain security database, config file, gdsintl2 and user UDF libs from previous installation
#  - Retain run user (firebird only) and service port from previous config
#  - Configurable run user (SS only) and service port settings
#  - Optional full backup of previous installation
#  - Seamless (I hope) uninstallation of previous installation (direct or RPM)
#  - Optional [on by default] creation of uninstallation script
#  - Optional change of SYSDBA password
#
#  Known issues:
#  - Do not support other installation directory than /opt/firebird, but it's prepared for this.
#  - Do not detects more than one previous installation, if more than one install is present, this
#    script would be in trouble right now.
#

#------------------------------------------------------------------------
#  Global variables

# Script configuration, change variables in next section if you change this script

reportTo="<pcisar@ibphoenix.com>"

# modified for SourceMage GNU/Linux
# Various script support variables




CurrentVersion="Firebird 1.5 RC7 (build 4027)"
Answer=""
verbose=0
completeUninstall=0
FBRootDir="/opt/firebird"
currentDir=`pwd`

# Linux distribution layout

linuxDistro="SourceMage"                  # RH, MDK, SuSE (see detectDistro)
serviceControler="xinetd"            	# inetd or xinetd ?

# Info gathered about previous installation

prevInstallType=""              # InterBase or Firebird ?
prevInstallDir=""               # Where we found it ?
prevInstall=""                  # Display string
prevInstallVersionStrin=""	# Version string (taken from gpre or gfix)
prevInstallVersion=""		# "1" for IB/FB or "2" for FB 1.5
prevInstallUser=""              # What user account prev. install used to run IB/FB ?
prevPort=""                     # Port used by previous gds_db service
prevInstallRPM=""               # It was installed by RPM ? If so, here is the package name
otherUDF=""                     # UDF libraries installed by user
gdsintl2=0                      # User provided gdsintl library ?

# Installation options

installIO="64"			# 32 or 64-bit I/O
installPort="3050"              # Default port for gds_db service
installUser="Ask"          	# Run user
installDir="/opt/firebird"      # Where to install Firebird
SYSDBAPassword="masterkey"	# SYSDBA password after installation

uninstall="Yes"                 # Retain uninstall for user ?
uninstallFile=""                # Uninstall file name

pkgMain="Ask"                   # Super Server OR Classic OR Client only install ?
pkgExamples="Ask"               # Install examples ?
pkgLibraries="Ask"              # Install libraries ?
pkgDoc="Ask"                    # Install documentation
pkgTools="Ask"                  # Install additional tools ?

#========================================================================
# Display and input routines

#------------------------------------------------------------------------
# Prompt for response, store result in Answer

AskQuestion() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	Test=$1
	DefaultAns=$2
	echo -n "${1}"
	Answer="$DefaultAns"
	read Answer
    else
	Answer=$2
    fi
}

#------------------------------------------------------------------------
# Prompt for yes or no answer - returns non-zero for no

AskYNQuestion() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	while echo -n "${*} (y/n): "
	do
	    read answer rest
	    case $answer in
    	    [yY]*)
		answer="y"
        	return 0
		;;
            [nN]*)
		answer="n"
		return 1
        	;;
	    *)
        	echo "Please answer y or n"
        	;;
	    esac
	done
    else
	answer="n"
        return 1
    fi
}

#------------------------------------------------------------------------
#  Display message if this is being run interactively.

displayMessage() {

    msgText=$*
    if [ $((InteractiveInstall)) -gt 0 ]
    then
	for msgText ;
    	    do echo $msgText ;
        done
    fi
}

#------------------------------------------------------------------------
#  Display message if this is being run with --verbose option.

verboseMessage() {

    msgText=$*
    if [ $((verbose)) -gt 0 ]
    then
	for msgText ;
	    do echo $msgText ;
	done
    fi
}

#------------------------------------------------------------------------
# Display message if this is being run interactively and exit.

displayExitMessage() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	echo ""
        echo "--- Warning ----------------------------------------------"
        echo ""
        for msgText ;
    	    do echo $msgText>&2 ;
        done
        echo ""
        echo "Installation ABORTED."
    else
        for msgText ;
    	    do echo $msgText 1>&2 ;
        done
        echo "Installation ABORTED." 1>&2
    fi
    removePartialInstall
}

#========================================================================
# System support routines

#------------------------------------------------------------------------
# Try to determine what distribution is this one (for various purposes)

detectDistro() {

    # it's not provided...
    if [ -z "$linuxDistro"  ]
    then
	if [ -e /etc/SuSE-release  ]
	then
	    # SuSE
	    linuxDistro="SuSE"
	elif [ -e /etc/mandrake-release ]
	then
	    # Mandrake
	    linuxDistro="MDK"
	elif [ -e /etc/debian_version ]
	then
	    # Debian
	    linuxDistro="Debian"
	elif [ -e /etc/gentoo-release ]
	then
	    # Debian
	    linuxDistro="Gentoo"
	elif [ -e /etc/rc.d/init.d/functions ]
	then
	    # very likely Red Hat
	    linuxDistro="RH"
	elif [ -d /etc/rc.d/init.d ]
	then
	    # generic Red Hat
	    linuxDistro="G-RH"
	elif [ -d /etc/init.d ]
	then
	    # generic SuSE
	    linuxDistro="G-SuSE"
	fi
    fi
}

#------------------------------------------------------------------------
# Check for inetd or xinetd

detectServiceControler() {

    if [ -d /etc/xinetd.d ]
    then
	serviceControler="xinetd"
    elif [ -d /etc/xinetd.conf ]
    then
	serviceControler="xinetd"
    elif [ -e /etc/inetd.conf ]
    then
	serviceControler="inetd"
    fi
}

#------------------------------------------------------------------------
# Run process and check status

runAndCheckExit() {
    
    Cmd=$*
    $Cmd
    ExitCode=$?

    if [ $ExitCode -ne 0 ]
    then
	echo "Install aborted: The command $Cmd " 1>&2
        echo "                 failed with error code $ExitCode" 1>&2
	removePartialInstall
    fi
}

#------------------------------------------------------------------------
# Execution of inetd/xinetd control script

serviceControl() {

    onlyonce=0
    for controlScript in /etc/init.d/$serviceControler /etc/rc.d/init.d/$serviceControler
    do
	if [ -x $controlScript ] && [ $onlyonce -eq 0 ]
        then
    	    displayMessage "Trying to $1 the $serviceControler service..."
	    $controlScript $1
	    onlyonce=1
        fi
    done
}

#------------------------------------------------------------------------
# Remove last dir (or filename) from path. Result is in $dir

removeLastDir() {

    location=`echo $1 | cut -d'/' --fields=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --output-delimiter=' '`
    result=""
    dir=""
    for i in $location
    do
	if [ "$i" != "" ]
	then
    	    if [ ! -z "$dir" ] && [ "$dir" != "." ]
    	    then
    		dir="/$dir"
    	    fi
    	    result="$result$dir"
    	    dir="$i"
	fi
    done
    dir="$result"
}

#------------------------------------------------------------------------
# Replace character / (up to 15 occurences) with \/ (needed for ED)

replaceSlashForED() {

    location=`echo $1 | cut -d'/' --fields=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --output-delimiter=' '`
    result=""
    for i in $location
    do
    	result="$result\/$i"
    done
}

#------------------------------------------------------------------------
# Check for specified file using whereis or find
# If file exists return 0 and location in $fileDir, otherwise return 1
# First parameter is seeking method: FIND or WHEREIS
# Second parameter is a filename
# Optional third parameter may specify additional whereis options.

checkFile() {

    file=$2
    fileDir=""
    dir=""
    if [ "$1" == "WHEREIS" ]
    then
	# WHEREIS 
	# --fields means directories here + file name, we suppose that file path is not deeper than 14 dirs
	location=`whereis $3 $file | cut -d' ' -f2 | cut -d'/' --fields=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --output-delimiter=' '`
    else
	# FIND
	location=`find $3 -name $file -print | cut -d'/' --fields=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --output-delimiter=' '`
    fi
    for i in $location
    do
	if [ "$i" != "" ]
	then
    	    if [ ! -z "$dir" ]
    	    then
		dir="/$dir"
    	    fi
    	    fileDir="$fileDir$dir"
    	    dir="$i"
        fi
    done
    if [ -z "$fileDir" ]
    then
	return 1
    else
	return 0
    fi
}

#------------------------------------------------------------------------
# Remove partial installation etc. and exit with 1

removePartialInstall() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
      echo "Removing partial installation..."
    fi
    if [ ! -z "$uninstallFile" ] && [ -x "$uninstallFile" ]
    then
	if [ $((completeUninstall)) -eq 1 ]
	then
	  finishUninstall
	fi
	$uninstallFile
    fi
#    if [ -d $currentDir/data  ]
#    then
#	rm -R $currentDir/data
#    fi
    exit 1
}

#========================================================================
# Various check and detection routines

#------------------------------------------------------------------------
# Check for correct run user

checkInstallUser() {

    if [ "`whoami`" != "root" ];
    then
      displayExitMessage "You need to be 'root' user to install Firebird !"
    fi
}

#------------------------------------------------------------------------
# Check if specified user account exists

checkUser() {

    testString=`grep $installUser /etc/passwd`
    if [ -z "$testString" ]
    then
	return 1
    else
	return 0
    fi
}

#------------------------------------------------------------------------
# Check if specified user group exists

checkGroup() {

    testString=`grep $installUser /etc/group`
    if [ -z "$testString" ]
    then
	return 1
    else
	return 0
    fi
}

#------------------------------------------------------------------------
# Read gds_db service configuration port if present

readPreviousPort() {

    if [ -r /etc/services ]
    then
	prevPort=`grep ^gds_db /etc/services | awk '{print $2}' | cut -d'/' -f1`
    fi
}

#------------------------------------------------------------------------
# Check for installed RPM package

checkForRPMInstall() {

    installRPM=""
    for PackageName in FirebirdSS FirebirdCS InterBase
    do
	rpm -q $PackageName>/dev/null 2>&1
	if [ $? -eq 0 ]
	then
    	    installRPM=$PackageName
	fi
    done
}

#------------------------------------------------------------------------
# Check if InterBase/Firebird is already installed

checkPreviousInstallation() {

#  checkFile "firebird"

    checkFile "WHEREIS" "ibserver" "-b"
    if [ $? -eq 0 ] 
    then
	prevInstallType="Super Server"
	prevInstallVersion="1"
	removeLastDir "$fileDir"
	prevInstallDir="$dir"
    fi
    checkFile "WHEREIS" "fbserver" "-b"
    if [ $? -eq 0 ] 
    then
	prevInstallType="Super Server"
	prevInstallVersion="2"
	removeLastDir "$fileDir"
	prevInstallDir="$dir"
    fi
    checkFile "WHEREIS" "gds_inet_server" "-b"
    if [ $? -eq 0 ] 
    then
	prevInstallType="Classic"
	prevInstallVersion="1"
	removeLastDir "$fileDir"
	prevInstallDir="$dir"
    fi
    checkFile "FIND" "fb_inet_server" "/usr/local"
    if [ $? -eq 0 ] 
    then
	prevInstallType="Classic"
	prevInstallVersion="2"
	removeLastDir "$fileDir"
	prevInstallDir="$dir"
    fi
    checkFile "FIND" "fb_inet_server" "/opt"
    if [ $? -eq 0 ] 
    then
	prevInstallType="Classic"
	prevInstallVersion="2"
	removeLastDir "$fileDir"
	prevInstallDir="$dir"
    fi
    if [ -z "$prevInstallType" ]
    then
	checkFile "WHEREIS" "libgds.so" "-b"
	if [ $? -eq 0 ] 
	then
	    if [ -L $fileDir/libgds.so ]
	    then
    		dir=`file $fileDir/libgds.so | cut -d' ' -f5`
		removeLastDir "$dir"
	        checkFile "FIND" "libgds.so" "$dir"
	    fi
    	    prevInstallType="Client"
	    removeLastDir "$fileDir"
	    prevInstallDir="$dir"
	fi
    fi
    if [ -x $prevInstallDir/bin/gpre ]
    then
      prevInstallVersionString=`$prevInstallDir/bin/gpre -z 2>&1 | tail -n 1 | cut -d' ' -f3-`
    fi
    if [ -r $prevInstallDir/README ] 
    then
	checkString=`grep "Firebird" $prevInstallDir/README`
	if [ -z "$checkString" ] 
	then
    	    prevInstall="InterBase $prevInstallType"
	else
    	    prevInstall="Firebird $prevInstallType"
	fi
    fi
    if [ -z "$prevInstallType" ] && [ ! -z "$prevInstall" ]
    then
	prevInstallType="Unknown architecture"
	prevInstall="$prevInstall $prevInstallType"
    fi
    checkForRPMInstall
}

#------------------------------------------------------------------------
# Check if $installPort port number is free for us

checkPort() {

    checkString=`netstat -an | egrep ''$installPort'.*LISTEN'`
    while [ ! -z "$checkString" ] 
    do
	if [ $((InteractiveInstall)) -gt 0 ]
	then
    	    echo ""
    	    echo "It seems that port $installPort was already taken by another service."
    	    AskYNQuestion "Would you like run Firebird on different port ?"
    	    if [ $? -eq 0 ]
    	    then
    		echo ""
    		AskQuestion "Please enter the new port number:"
    		installPort=$Answer
    		checkString=`netstat -an | egrep ''$installPort'.*LISTEN'`
    	    else
    		displayExitMessage "You refused to run Firebird on different, free port." 
    	    fi
	else
    	    displayExitMessage "It seems that port $installPort was already taken by another service." \
	    "You must specify different, free port by --port option." 
	fi
    done
}

#========================================================================
# Pre-install routines

#------------------------------------------------------------------------
#  Stop super server if it is running 

stopServerIfRunning() {

    # First the easy one - the Super Server
    # We will try to shut it down only by control script...
    checkString=`ps -efww| egrep "(ibserver|ibguard|fbserver|fbguard)" |grep -v grep`
    controlScript=""
    if [ ! -z "$checkString" ] 
    then
        # Look for firebird or interbase control script
        if [ -f /etc/init.d/firebird ]
        then
    	    controlScript="/etc/init.d/firebird stop"
        elif [ -f /etc/init.d/runlevels/%3/firebird ]  # SourceMage
        then
    	    controlScript="/etc/init.d/runlevels/%3/firebird stop"
        elif [ -f /etc/rc.d/init.d/firebird ]
        then
    	    controlScript="/etc/rc.d/init.d/firebird stop"
        elif [ -f /etc/init.d/interbase ]
        then
    	    controlScript="/etc/init.d/interbase stop"
        elif [ -f /etc/rc.d/init.d/interbase ]
        then
    	    controlScript="/etc/rc.d/init.d/interbase stop"
        fi
        if [ ! -z "$controlScript" ]
        then
    	    displayMessage "$prevInstall is running, trying to shut it down..."
    	    $controlScript
        fi
    fi
    checkString=`ps -efww | egrep "(ibserver|ibguard|fbserver|fbguard)" | grep -v grep`
    if [ ! -z "$checkString" ] 
    then
        displayExitMessage "An attempt to stop the running $prevInstall failed." \
        "(the ibserver or ibguard process was detected running on your system)"  \
        "Please quit all Firebird/InterBase applications and then proceed." 
    fi
    # Classic is tricky, because if gds_inet_server is present, someone
    # is attached remotely and we can't shut it down...
    # Unfortunatelly, we can't detect Classic that runs in local connection mode.
    checkString=`ps -efww | egrep "(gds_inet_server|gds_pipe|fb_inet_server)" | grep -v grep`
    if [ ! -z "$checkString" ] 
    then
        displayExitMessage "An instance of the $prevInstall server seems to be running." \
        "(the gds_inet_server or fb_inet_server or gds_pipe process was detected running" \
	"on your system)"  \
        "Please quit all Firebird/InterBase applications and then proceed." 
    fi
    # Well, it seems that Firebird/InterBase do not runs, but we'll check if there
    # isn't any service listening on port used for Firebird. If so, it may be just
    # inetd/xinetd for previous installation
    if [ -z "$prevPort" ]
    then
        checkPort=installPort
    else
        checkPort="$prevPort"
    fi
    checkString=`netstat -an | egrep ''$checkPort'.*LISTEN'`
    if [ ! -z "$checkString" ] 
    then
        # Someone is listening on our port, let's check it out...
        if [ "$prevInstallType" == "Classic" ]
        then
    	    checkString=`netstat -apn | egrep ''$checkPort'.*LISTEN' | grep inetd`
    	    if [ ! -z "$checkString" ] 
    	    then
		# Well, it seems like inetd/xinetd is still listening for Classic.
		# We'll ask to shut it down (and note that for latter use).
        	if [ $((InteractiveInstall)) -gt 0 ]
        	then
  		    echo ""
		    echo "It seems that $serviceControler is listening for gds_db service."
		    echo "To proceed with installation, we need to shut it down."
		fi
		AskYNQuestion "Can setup try to shut down the $serviceControler service ?"
		if [ $? -eq 0 ]
		then
		    serviceControl "stop"
		else
		    displayExitMessage "Please stop the $serviceControler service and then proceed."
		fi
        	checkString=`netstat -apn | egrep ''$checkPort'.*LISTEN' | grep inetd`
        	if [ ! -z "$checkString" ] 
        	then
		    displayExitMessage "It seems that our attempt to shut down the $serviceControler service failed." \
		    "Please stop the inetd/xinetd service manually and then proceed."
		fi
	    else
		# It's not inetd/xinetd, so we'll give up on that...
        	displayExitMessage "An instance of the $prevInstall seems to be running." \
        	"(netstat -an reports a process is already listening on port $checkPort)" \
        	"Please quit all Firebird/InterBase applications and then proceed." 
	    fi
        else
    	    # It should not be Firebird/InterBase Super Server (see above) but something else.
	    # We'll give up on that...
    	    displayExitMessage "An instance of the $prevInstall seems to be running." \
            "(netstat -an reports a process is already listening on port $checkPort)" \
            "Please quit all Firebird/InterBase applications and then proceed." 
        fi
    fi
    # Stop lock manager if it is the only thing running.
    for i in `ps -efww | egrep "[fb|gds]_lock_mgr" | awk '{print $2}' `
    do
	kill $i
    done
}

#------------------------------------------------------------------------
# We'd like protect any important files or configuration from previous installation.

archivePriorConfiguration() {

    # Protect important files from previous installation
    for file in isc4.gdb security.fdb firebird.conf SYSDBA.password ;
    do
	if [ -r $prevInstallDir/$file ]
	then
    	    displayMessage "Making a backup copy of $prevInstallDir/$file to /tmp"
    	    cp $prevInstallDir/$file /tmp/$file
	fi
    done
    # Build list of user supplied UDF's and backup them
    UDFDir=""
    oldPWD=`pwd`
    if [ -d $prevInstallDir/UDF ]
    then
	UDFDir="$prevInstallDir/UDF"
    fi
    if [ -d $prevInstallDir/udf ]
    then
	UDFDir="$prevInstallDir/udf"
    fi
    if [ ! -z "$UDFDir" ]
    then
	cd $UDFDir
	for file in `ls`
	do
	    if [ "$file" != "ib_udf.so" ] && [ "$file" != "fbudf.so" ] && [ "$file" != "ib_udf.sql" ] && [ "$file" != "fbudf.sql" ]
	    then
    		otherUDF="$otherUDF $file"
    		displayMessage "Making a backup copy of $UDFDir/$file to /tmp"
    		cp $UDFDir/$file /tmp/$file
	    fi
	done
	cd $oldPWD
    fi
    if [ -r $prevInstallDir/intl/fbintl2 ]
    then
	displayMessage "Making a backup copy of $prevInstallDir/intl/fbintl2 to /tmp"
	cp $prevInstallDir/intl/fbintl2 /tmp/fbintl2
	gdsintl2=1
    fi
}

#------------------------------------------------------------------------
#  Archive any existing prior installed files.
#  The 'cd' stuff is to avoid the "leading '/' removed message from tar.
#  for the same reason the DestFile is specified without the leading "/"

archivePriorInstallSystemFiles() {

    ArchiveDateTag=`date +"%Y%m%d_%H%M"`
    ArchiveMainFile="${prevInstallDir}_${ArchiveDateTag}.tar.gz"
    oldPWD=`pwd`
    archiveFileList=""

    cd /

    DestFile="$prevInstallDir"
    if [ -e $DestFile ]
    then
      archiveFileList="$archiveFileList $DestFile"
    fi

    for i in gds.h blr.h ibase.h iberror.h ib_util.h perf.h gds.f
    do
        DestFile=usr/include/$i
        if [ -e $DestFile ]
        then
    	    archiveFileList="$archiveFileList $DestFile"
        fi
    done

    for i in gds_pyxis.a gds.a libgds.so.0 libgds.so libib_util.so libgds.a libfbembed.so libfbembed.so.1 libfbembed.so.1.5.0
    do
        DestFile=usr/lib/$i
        if [ -e $DestFile ]
        then
            archiveFileList="$archiveFileList $DestFile"
        fi
    done

    for i in usr/sbin/rcfirebird etc/init.d/firebird etc/rc.d/init.d/firebird
    do
        DestFile=$i
        if [ -e $DestFile ]
        then
            archiveFileList="$archiveFileList $DestFile"
        fi
    done

    if [ ! -z "$archiveFileList" ]
    then
	displayMessage "Archiving..."
        runAndCheckExit "tar -czf $ArchiveMainFile $archiveFileList"
        displayMessage "Done."
    fi
    cd $oldPWD
}

#------------------------------------------------------------------------
# Remove previous installation

removePreviousInstallation() {

    if [ ! -z "$prevInstall" ] 
    then
	if [ ! -z "$installRPM" ]
	then
    	    # It was RPM installation, so we offer to remove it by RPM...
    	    if [ $((InteractiveInstall)) -gt 0 ]
    	    then
    		echo "To proceed, the previous installation of $prevInstall"
		echo "must be removed by running rpm -e $installRPM"
		AskYNQuestion "Can install remove the $installRPM package ?"
    		if [ $? -eq 0 ]
    		then
		    echo "Removing previous installation..."
		    runAndCheckExit "rpm -e $installRPM"
        	    checkForRPMInstall
		    if [ ! -z $installRPM ]
		    then
        		displayExitMessage "It seems that you must remove the $installRPM package manually and then proceed."
		    fi
		else
		    displayExitMessage "You must remove the $installRPM package manually and then proceed."
		fi
    	    else
    		runAndCheckExit "rpm -e $installRPM"
    		checkForRPMInstall
    		if [ ! -z $installRPM ]
		then
        	    displayExitMessage "It seems that you must remove the $installRPM package manually and then proceed."
		fi
    	    fi
	else
    	    # Check if uninstall script is present
    	    if [ -x $prevInstallDir/uninstall ]
    	    then
    		displayMessage "Running uninstall..."
		if [ $((verbose)) -eq 1 ]
		then
  		    $prevInstallDir/uninstall --verbose
		else
  		    $prevInstallDir/uninstall
		fi
    	    else
    		# We don't have uninstall script, so we offer direct removal
    		echo "To proceed, the previous installation of $prevInstall"
		echo "must be directly removed."
		echo "This mean complete removal of $prevInstallDir directory and probably"
		echo "some files in /usr/lib and /usr/include."
		AskYNQuestion "Can install remove the $prevInstallDir directory and other files ?"
    		if [ $? -eq 0 ]
    		then
		    echo "Removing previous installation..."
		    # Main IB/FB directory
		    if [ -d $prevInstallDir ]
		    then
  			verboseMessage "Removing $prevInstallDir directory..."
			`rm -r $prevInstallDir`
		    fi
		    # Known /usr/lib files
		    for file in libgds.a libgds.so libgds.so.0 libib_util.so libfbembed.so libfbembed.so.1 libfbembed.so.1.5.0 libfbclient.so libfbclient.so.1 libfbclient.so.1.5.0
		    do
			if [ -e /usr/lib/$file ] || [ -L /usr/lib/$file ]
			then
	    		    verboseMessage "Removing /usr/lib/$file..."
	    		    `rm /usr/lib/$file`
			fi
		    done
		    # Known /usr/include files
		    for file in gds.h blr.h ib_util.h ibase.h iberror.h gds.f perf.h
		    do
			if [ -e /usr/include/$file ] || [ -L /usr/include/$file ]
			then
  	    		    verboseMessage "Removing /usr/include/$file..."
	    		    `rm /usr/include/$file`
			fi
		    done
		    # Other known files
		    for file in /etc/init.d/firebird /etc/rc.d/init.d/firebird /usr/sbin/rcfirebird /etc/init.d/interbase /etc/rc.d/init.d/interbase
		    do
			if [ -e $file ] || [ -L $file ]
			then
  	    		    verboseMessage "Removing $file..."
	    		    `rm $file`
			fi
		    done
		fi
    	    fi
	fi
    fi
}

#------------------------------------------------------------------------
# Create user group and account if they don't exists

createGroupAndUserAccount() {

    checkGroup
    if [ $? -eq 1 ]
    then
	displayMessage "Creating group $installUser..."
        groupadd -g 84 -o -r $installUser
    fi

    checkUser
    if [ $? -eq 1 ]
    then
	displayMessage "Creating user $installUser..."
        useradd -o -r -M -d $installDir -s /bin/bash \
            -c "Firebird Database Administrator" -g $installUser -u 84 $installUser
    fi
}

#========================================================================
# Installation routines

#------------------------------------------------------------------------
# Create core uninstall script in current directory. We will use this
# script to remove partially installed Firebird if something will go wrong.
# At the end we will discard it or copy it to target directory.

createUninstall() {

    targetDir=$1
    if [ -r $currentDir/data/scripts/uninstall ]
    then
	uninstallFile="$currentDir/uninstall"
	cp $currentDir/data/scripts/uninstall $uninstallFile
	chmod u+x $uninstallFile
	echo "Install=\"Firebird $pkgMain\"">>$uninstallFile
	echo "InstallType=\"$pkgMain\"">>$uninstallFile
	echo "installDir=\"$installDir\"">>$uninstallFile
	echo "runUser=\"$installUser\"">>$uninstallFile
	echo "Port=\"$installPort\"">>$uninstallFile
	echo "linuxDistro=\"$linuxDistro\"">>$uninstallFile
	echo "serviceControler=\"$serviceControler\"">>$uninstallFile
	echo "">>$uninstallFile
	echo "stopServerIfRunning">>$uninstallFile
	echo "removeInitdScript">>$uninstallFile
	echo "">>$uninstallFile
	completeUninstall=1
    else
	displayExitMessage "Core uninstallation script not found !" \
	"Please report this problem to $reportTo"
    fi
}

#------------------------------------------------------------------------
# Finishing uninstall script

finishUninstall() {

    # Remove configuration
    echo "# Remove Firebird Service">>$uninstallFile
    echo "removeService">>$uninstallFile

    # Uninstall: Remove (empty) created directories
    echo "# Remove created directories">>$uninstallFile
    for dir in $uninstallDirs
    do
        if [ "$dir" != "$installDir" ]
        then
    	cat <<EOF >>$uninstallFile
removeDirectory "$dir"
EOF
        fi
    done
    # Remove uninstall script
    if [ "$uninstall" == "Yes" ]
    then
	cat <<EOF >>$uninstallFile
removeFile "$installDir/uninstall"
EOF
    else
	cat <<EOF >>$uninstallFile
removeFile "$uninstallFile"
EOF
    fi
    # Remove (empty) main installation directory
    cat <<EOF >>$uninstallFile
if [ -d $installDir ] 
then
  verboseMessage "Removing $installDir directory..."
  \`rmdir $installDir\`
fi 
EOF
    completeUninstall=0
}

#------------------------------------------------------------------------
# Create directory and note entry for uninstall
# $1 directory name
# $2 desired directory permissions

uninstallDirs=""

installDirectory() {

    directory="$1"
    rights="$2"
    if [ ! -z "$rights" ]
    then
	showRights="($rights)"
    else
	showRights=""
    fi
    if [ ! -d $directory ]
    then
	verboseMessage "Creating direcory $directory $showRights"
	mkdir -p $directory
	if [ ! -d $directory ]
	then
    	    displayExitMessage "Cannot create directory $directory"
	fi
	uninstallDirs="$directory $uninstallDirs"
	if [ ! -z "$rights" ]
	then
    	    chmod $rights $directory
	fi
	if [ "$installUser" != "N/A" ]
	then
	    chown $installUser:$installUser $directory
	fi
    fi
}

#------------------------------------------------------------------------
# Install file and create entry in uninstall for it.
# $1 filename (in distribution package)
# $2 location in distribution package
# $3 target location
# $4 desired file permissions
# $5 target filename (required if different from $1)

installFile() {

    file="$1"
    source="$2"
    dest="$3"
    rights="$4"
    newfile="$5"

    if [ -z $newfile ]
    then
	newfile="$file"
    fi
    if [ ! -z "$rights" ]
    then
	showRights=" ($rights)..."
    else
	showRights="..."
    fi
    if [ -e $source$file ]
    then
	verboseMessage "Copying file $dest$file$showRights"
	`cp -f -p $source$file $dest$newfile`
    fi
    if [ ! -e $dest$newfile ]
    then
	displayExitMessage "Cannot create target file $dest$newfile"
    fi
    if [ ! -z "$rights" ]
    then
	chmod $rights $dest$newfile
    fi
    if [ "$installUser" != "N/A" ]
    then
	chown $installUser:$installUser $dest$newfile
    fi
    cat <<EOF >>$uninstallFile
removeFile "$dest$newfile"
EOF
}

#------------------------------------------------------------------------
# Create install file and create entry in uninstall for it.
# $1 target location
# $2 filename
# $3 desired file permissions

createInstallFile() {

    dest="$1"
    file="$2"
    rights="$3"

    if [ ! -z "$rights" ]
    then
	showRights=" ($rights)..."
    else
	showRights="..."
    fi
    verboseMessage "Creating file $dest$file$showRights"
    `touch $dest$file`
    if [ ! -e $dest$file ]
    then
	displayExitMessage "Cannot create target file $dest$file"
    fi
    if [ ! -z "$rights" ]
    then
	chmod $rights $dest$file
    fi
    if [ "$installUser" != "N/A" ]
    then
	chown $installUser:$installUser $dest$file
    fi
    cat <<EOF >>$uninstallFile
removeFile "$dest$file"
EOF
}


#------------------------------------------------------------------------
# Create symlink for installed file and create entry in uninstall for it
# $1 source file
# $2 target symlink
# $3 desired symlink permissions

linkInstallFile() {

    sourceFile="$1"
    destLink="$2"
    rights="$3"

    if [ ! -z "$rights" ]
    then
	showRights=" ($rights)..."
    else
	showRights="..."
    fi
    if [ -e $source$file ]
    then
	verboseMessage "Create symlink $destLink$showRights"
	`ln -sf $sourceFile $destLink`
    fi
    if [ ! -L $destLink ]
    then
	displayExitMessage "Cannot create symlink $destLink for $sourceFile"
    fi
    if [ ! -z "$rights" ]
    then
	chmod $rights $destLink
    fi
    cat <<EOF >>$uninstallFile
removeFile "$destLink"
EOF
}

#------------------------------------------------------------------------
# Install common files for server packages (CS+SS)
# This routine should be called *only* from installPackages !!!

installCommonServerFiles() {

    # Common server files
    source="$currentDir/data/"
    dest="$installDir/"
    installFile "README" $source $dest "a=r"
    installFile "WhatsNew" $source $dest "a=r"
    installFile "security.fdb" $source $dest "ug=rw,o="
    installFile "firebird.msg" $source $dest "a=r"
    installFile "firebird.conf" $source $dest "ug=rw,o="
    installFile "aliases.conf" $source $dest "ug=rw,o="
    installFile "de_DE.msg" $source $dest "a=r"
    installFile "fr_FR.msg" $source $dest "a=r"
    installFile "ja_JP.msg" $source $dest "a=r"
    # Log and lock files...
    createInstallFile $dest "firebird.log" "ug=rw,o=r"
    createInstallFile $dest "isc_init1."`hostname` "ug=rw,o="
    createInstallFile $dest "isc_lock1."`hostname` "ug=rw,o="
    createInstallFile $dest "isc_event1."`hostname` "ug=rw,o="
    createInstallFile $dest "isc_guard1."`hostname` "ug=rw,o="
    # INTL library
    installDirectory "$installDir/intl" "o=rx"
    source="$currentDir/data/intl/"
    dest="$installDir/intl/"
#    installFile "fbintl" $source $dest "ug=r,o="
    installFile "libfbintl.so" $source $dest "ug=r,o="
    # Standard UDF's
    installDirectory "$installDir/UDF" "o=rx"
    source="$currentDir/data/UDF/"
    dest="$installDir/UDF/"
    installFile "ib_udf.so" $source $dest "ug=r,o="
#    installFile "ib_udf.sql" $source $dest "ug=r,o="
    installFile "fbudf.so" $source $dest "ug=r,o="
#    installFile "fbudf.sql" $source $dest "ug=r,o="

}

#------------------------------------------------------------------------
# Install packages

installPackages() {

    # Create target directory
    installDirectory "$installDir" "o=rx"
    # Prepare uninstall script...
    createUninstall  "$installDir"
    if [ "$pkgMain" == "Super Server" ]
    then
	echo "Installing Super Server..."
        echo "# Super Server">>$uninstallFile
        echo "displayMessage \"Removing Super Server\"">>$uninstallFile
	# Common Server files
	installCommonServerFiles
	# Common binary files
	installDirectory "$installDir/bin" "a=rx"
	source="$currentDir/data/bin/"
        dest="$installDir/bin/"
	installFile "gbak" $source $dest "ug=x,o="
        installFile "gfix" $source $dest "ug=x,o="
	installFile "gsec" $source $dest "ug=x,o="
        installFile "isql" $source $dest "a=x"
	linkInstallFile $dest"isql" "/usr/local/bin/fbisql" "a=x"
	# Arch. specific server files
	installDirectory "$installDir/bin" "a=rx"
	source="$currentDir/data/bin/"
	dest="$installDir/bin/"
	installFile "fbmgr.bin" $source $dest "ug=x,o="
	installFile "fbserver" $source $dest "u=x,go="
	installFile "fbguard" $source $dest "u=x,go="
	# Create fbmgr control script
	cat > $currentDir/data/bin/fbmgr <<EOF
#!/bin/sh
FIREBIRD=$installDir
export FIREBIRD
exec \$FIREBIRD/bin/fbmgr.bin \$@
EOF
	installFile "fbmgr" $source $dest "ug=rx,o="
	# changeDBAPassword script
	scriptFile="changeDBAPassword.sh"
	installFile $scriptFile $source $dest "u=rx,go="
	replaceSlashForED $installDir
	ed -s $dest$scriptFile <<EOF > /dev/null
,s/FIREBIRD=.*/FIREBIRD=$result/g
w
q
EOF
	# Client libraries
	installDirectory "$installDir/lib" "o=rx"
	source="$currentDir/data/lib/"
	dest="$installDir/lib/"
	installFile "libfbclient.so.1.5.0" $source $dest "ug=rx,o=x"
	linkInstallFile $dest"libfbclient.so.1.5.0" $dest"libfbclient.so.1" "a=rx"
	linkInstallFile $dest"libfbclient.so.1" $dest"libfbclient.so" "a=rx"
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libfbclient.so.1.5.0" "a=rx"
	linkInstallFile "/usr/lib/libfbclient.so.1.5.0" "/usr/lib/libfbclient.so.1" "a=rx"
	linkInstallFile "/usr/lib/libfbclient.so.1" "/usr/lib/libfbclient.so" "a=rx"
	# Backward compatibility symlinks
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libgds.so.0" "a=rx"
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libgds.so" "a=rx"
	# Other client libraries...
	installFile "libib_util.so" $source $dest "ug=rx,o=x"
	linkInstallFile $dest"libib_util.so" "/usr/lib/libib_util.so" "a=rx"

	# initd script
	if [ -d /etc/init.d ]
	then
    	    dest="/etc/init.d/"
	elif [ -d /etc/rc.d/init.d ]
	then
    	    dest="/etc/rc.d/init.d/"
	fi
	if [ "$linuxDistro" == "SuSE" ] || [ "$linuxDistro" == "G-SuSE" ]
	then
	    file="firebird.init.d.suse"
	elif [ "$linuxDistro" == "MDK" ]
	then
	    file="firebird.init.d.mandrake"
	elif [ "$linuxDistro" == "Debian" ]
	then
	    file="firebird.init.d.debian"
	elif [ "$linuxDistro" == "Gentoo" ]
	then
	    file="firebird.init.d.gentoo"
	else
	    file="firebird.init.d.generic"
	fi
	if [ "$linuxDistro" != "SourceMage" ]
	then
  	  source="$currentDir/data/scripts/"
	  installFile $file $source $dest "u=rwx,g=rx,o=" "firebird"
	  linkInstallFile $dest"firebird" "/usr/sbin/rcfirebird" "ug=rx"
        fi
    fi

    if [ "$pkgMain" == "Classic" ]
    then
	echo "Installing Classic Server..."
    	echo "# Classic Server">>$uninstallFile
        echo "displayMessage \"Removing Classic Server\"">>$uninstallFile
	# Common server files
	installCommonServerFiles
	# Common binary files
	installDirectory "$installDir/bin" "a=rx"
	source="$currentDir/data/bin/"
        dest="$installDir/bin/"
# changed for smgl
	installFile "gbak" $source $dest "ug=x,o=" "gbak"
        installFile "gfix" $source $dest "ug=x,o=" "gfix"
	installFile "gsec" $source $dest "ug=x,o=" "gsec"
        installFile "isql" $source $dest "a=x" "isql"
	linkInstallFile $dest"isql" "/usr/bin/fbisql" "a=x"
	# Arch. specific server files
	installDirectory "$installDir/bin" "a=rx"
	source="$currentDir/data/bin/"
	dest="$installDir/bin/"
	installFile "fb_inet_server" $source $dest "ug=rxs,o="
	installFile "fb_lock_mgr" $source $dest "ug=rxs,o="
#	installFile "gds_pipe" $source $dest "ug=xs,o="
	# Core library
	installDirectory "$installDir/lib" "o=rx"
	source="$currentDir/data/lib/"
	dest="$installDir/lib/"
	installFile "libfbembed.so.1.5.0" $source $dest "ug=rx,o=x"
	linkInstallFile $dest"libfbembed.so.1.5.0" $dest"libfbembed.so.1" "a=rx"
	linkInstallFile $dest"libfbembed.so.1" $dest"libfbembed.so" "a=rx"
	linkInstallFile $dest"libfbembed.so.1.5.0" "/usr/lib/libfbembed.so.1.5.0" "a=rx"
	linkInstallFile "/usr/lib/libfbembed.so.1.5.0" "/usr/lib/libfbembed.so.1" "a=rx"
	linkInstallFile "/usr/lib/libfbembed.so.1" "/usr/lib/libfbembed.so" "a=rx"
	# Backward compatibility symlinks
	linkInstallFile $dest"libfbembed.so.1.5.0" "/usr/lib/libgds.so.0" "a=rx"
	linkInstallFile $dest"libfbembed.so.1.5.0" "/usr/lib/libgds.so" "a=rx"
	# Other client libraries...
	installFile "libib_util.so" $source $dest "ug=r,o="
	linkInstallFile $dest"libib_util.so" "/usr/lib/libib_util.so" "a=rx"
    fi

    # Restore configuration and other important files from previous installation
    if [ "$pkgMain" != "Client" ]
    then
	if [ ! -z "$prevInstall" ]
	then
	    # Restore security.fdb as security.fdb.old
	    if [ -e /tmp/security.fdb ]
	    then
		verboseMessage "Restoring security.fdb as security.fdb.old"
		cp /tmp/security.fdb $installDir/security.fdb.old
	    fi
	    # restore firebird.conf as firebird.conf.old
	    if [ -e /tmp/firebird.conf ]
	    then
		verboseMessage "Restoring firebird.conf as firebird.conf.old"
		cp /tmp/firebird.conf $installDir/firebird.conf.old
	    fi
	fi
	# If there are user UDF's or gdsintl2 from previous installation, copy them in...
	if [ $((gdsintl2)) -ne 0  ]
	then
	    verboseMessage "Restoring fbintl2..."
	    # fbintl2
	    cp /tmp/fbintl2 $installDir/intl/fbintl2
	fi
	if [ ! -z "otherUDF" ]
	then
	    for file in $otherUDF
	    do
		verboseMessage "Restoring UDF $file..."
		cp /tmp/$file $installDir/UDF/$file
	    done
	fi
    fi

    if [ "$pkgMain" == "Client" ]
    then
	echo "Installing Client..."
    	echo "# Firebird client">>$uninstallFile
        echo "displayMessage \"Removing Firebird Client\"">>$uninstallFile
	# Common files
	source="$currentDir/data/" 
	dest="$installDir/"
	installFile "README" $source $dest "a=r"
	installFile "firebird.msg" $source $dest "a=r"
	installFile "de_DE.msg" $source $dest "a=r"
	installFile "fr_FR.msg" $source $dest "a=r"
	installFile "ja_JP.msg" $source $dest "a=r"
	# Client libraries
	installDirectory "$installDir/lib" "o=rx"
	source="$currentDir/data/lib/"
	dest="$installDir/lib/"
	installFile "libfbclient.so.1.5.0" $source $dest "ug=rx,o=x"
	linkInstallFile $dest"libfbclient.so.1.5.0" $dest"libfbclient.so.1" "a=rx"
	linkInstallFile $dest"libfbclient.so.1" $dest"libfbclient.so" "a=rx"
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libfbclient.so.1.5.0" "a=rx"
	linkInstallFile "/usr/lib/libfbclient.so.1.5.0" "/usr/lib/libfbclient.so.1" "a=rx"
	linkInstallFile "/usr/lib/libfbclient.so.1" "/usr/lib/libfbclient.so" "a=rx"
	# Backward compatibility symlinks
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libgds.so.0" "a=rx"
	linkInstallFile $dest"libfbclient.so.1.5.0" "/usr/lib/libgds.so" "a=rx"
    fi

    if [ "$pkgExamples" == "Yes" ]
    then
	echo "Installing examples..."
    	echo "# Examples">>$uninstallFile
        echo "displayMessage \"Removing examples\"">>$uninstallFile
	installDirectory "$installDir/examples" "o=rx"
	source="$currentDir/data/examples/v5/"  #smgl
	dest="$installDir/examples/"
	cd "$currentDir/data/examples/v5/"	#smgl
	for file in `ls`
	do
	    # databases must have R/W rights, R for all other files
	    if [ ! -z "`echo "$file" | grep .fdb`" ]
	    then
		rights="a=rw"
	    else
		rights="a=r"
	    fi
    	    installFile $file $source $dest $rights
	done
	cd $currentDir
    fi

    if [ "$pkgLibraries" == "Yes" ]
    then
	echo "Installing libraries... "
    	echo "# Firebird libraries for developers">>$uninstallFile
        echo "displayMessage \"Removing libraries\"">>$uninstallFile
	# Libraries
	installDirectory "$installDir/lib" "o=rx"
	source="$currentDir/data/lib/"
	dest="$installDir/lib/"
### !!! We still haven't any .a libraries for 1.5
#	installFile "libgds.a" $source $dest "a=r"
#	linkInstallFile $dest"libgds.a" "/usr/lib/libgds.a" "a=r"
	# Include files...
	installDirectory "$installDir/include" "o=rx"
	source="$currentDir/data/include/"
	dest="$installDir/include/"
	installFile "blr.h" $source $dest "a=r"
	installFile "gds.h" $source $dest "a=r"
	installFile "ib_util.h" $source $dest "a=r"
	installFile "ibase.h" $source $dest "a=r"
	installFile "iberror.h" $source $dest "a=r"
	installFile "perf.h" $source $dest "a=r"
#	installFile "gds.f" $source $dest "a=r"
	linkInstallFile $dest"blr.h" "/usr/include/blr.h" "a=r"
	linkInstallFile $dest"gds.h" "/usr/include/gds.h" "a=r"
#	linkInstallFile $dest"gds.f" "/usr/include/gds.f" "a=r"
	linkInstallFile $dest"ibase.h" "/usr/include/ibase.h" "a=r"
	linkInstallFile $dest"iberror.h" "/usr/include/iberror.h" "a=r"
	linkInstallFile $dest"perf.h" "/usr/include/perf.h" "a=r"
	linkInstallFile $dest"ib_util.h" "/usr/include/ib_util.h" "a=r"
    fi

    if [ "$pkgDoc" == "Yes" ]
    then
	echo "Installing documentation..."
    	echo "# Documentation">>$uninstallFile
        echo "displayMessage \"Removing documentation\"">>$uninstallFile
	installDirectory "$installDir/doc" "o=rx"
	source="$currentDir/data/doc/"
	dest="$installDir/doc/"
	cd "$currentDir/data/doc"
	for file in `ls`
	do
    	    installFile $file $source $dest "a=r"
	done
	cd $currentDir
    fi

    if [ "$pkgTools" == "Yes" ]
    then
	echo "Installing additional tools..."
    	echo "# Additional tools">>$uninstallFile
        echo "displayMessage \"Removing additional tools\"">>$uninstallFile
	installDirectory "$installDir/bin" "a=rx"
	source="$currentDir/data/bin/"
	dest="$installDir/bin/"
#!!!    Tools are now linked to different client libraries !!!
#	if [ "$pkgMain" == "Classic" ]
#	then
#	    installFile "gdef.cs" $source $dest "a=x" "gdef"
#	    installFile "gds_drop.cs" $source $dest "ug=x" "gds_drop"
#	    installFile "gpre.cs" $source $dest "a=x" "gpre"
#	     installFile "gsplit" $source $dest "a=x"
#	    installFile "gstat.cs" $source $dest "a=x" "gstat"
#	    installFile "fb_lock_print.cs" $source $dest "ug=x" "fb_lock_print"
#	    installFile "qli.cs" $source $dest "a=x" "qli"
#	else
	    installFile "gdef" $source $dest "a=x"
	    installFile "gds_drop" $source $dest "ug=x"
	    installFile "gpre" $source $dest "a=x"
#	     installFile "gsplit" $source $dest "a=x"
	    installFile "gstat" $source $dest "a=x"
	    installFile "fb_lock_print" $source $dest "ug=x"
	    installFile "qli" $source $dest "a=x"
#	fi
	installDirectory "$installDir/help" "a=rx"
	source="$currentDir/data/help/"
	dest="$installDir/help/"
	installFile "help.fdb" $source $dest "a=rw"
#	installFile "help.gbak" $source $dest "a=rw"
    fi

    # Uninstall script finalization...
    finishUninstall
}

#========================================================================
# Post-install configuration

#------------------------------------------------------------------------
# Add service entry in /etc/services, or change it if it's different than installPort

configureService() {

    displayMessage "Configuring gds_db service on port $installPort..."
    configEntry="gds_db          $installPort/tcp  # Firebird Database Remote Protocol"
    configFile="/etc/services"
    if [ -z "$prevPort" ]
    then
	# Add gds_db entry to /etc/services
	echo "$configEntry">>$configFile
    else
#	if [ "$prevPort" != "$installPort" ]
#	then
	    # /etc/services contains another port for gds_db than installPort, so we must change it
    	    cat $configFile | grep -v "^gds_db" > $configFile.tmp
    	    mv -b $configFile.tmp $configFile
	    echo "$configEntry">>$configFile
#	fi
    fi
    if [ "$pkgMain" == "Classic" ]
    then
	# We also need to configure inetd/xinetd
	displayMessage "Configuring $serviceControler service to run Firebird Classic..."
	if [ "$serviceControler" == "inetd" ]
	then
	    # inetd
	    configEntry="gds_db  stream  tcp     nowait.30000      $installUser $installDir/bin/fb_inet_server fb_inet_server # Firebird Database Remote Server"
	    configFile="/etc/inetd.conf"
	    checkString=`grep ^gds_db $configFile`
	    if [ -z "$checkString" ]
	    then
		# Add gds_db entry to /etc/inetd.conf
		echo "$configEntry">>$configFile
	    else
		# /etc/inetd.conf already contains entry for gds_db, so we must change it
    		cat $configFile | grep -v "^gds_db" > $configFile.tmp
    		mv -b $configFile.tmp $configFile
		echo "$configEntry">>$configFile
	    fi
	else
	    # xinetd
	    if [ -d /etc/xinetd.d ]
	    then
		# Directory-based configuration
		configFile=`grep -l gds_db /etc/xinetd.d/*`
		if [ ! -z "$configFile" ]
		then
		    # Remove previous configuration file for gds_db service
		    rm $configFile
		fi
		cat <<EOF >>/etc/xinetd.d/firebird
# default: on
# description: Firebird server
service gds_db
{
    flags		= REUSE
    socket_type		= stream
    wait		= no
    user		= $installUser
    log_on_success	+= USERID
    log_on_failure 	+= USERID
    server		= $installDir/bin/fb_inet_server
    disable         	= no
}
EOF
	    else
		# File-based configuration
		displayExitMessage "**** We don't know how to handle xinetd file-based configuration" \
		"Please update file /etc/xinetd.conf"
	    fi
	fi
	# Restart control service
	serviceControl "restart"
    fi
}

#------------------------------------------------------------------------
# Configuration of initd for Super Server

configureInitdScript() {

    if [ "$pkgMain" == "Super Server" ]
    then
	displayMessage "Configuring initd to run Firebird Super Server..."
	if [ -d /etc/init.d ]
	then
    	    scriptFile="/etc/init.d/firebird"
	elif [ -d /etc/rc.d/init.d ]
	then
    	    scriptFile="/etc/rc.d/init.d/firebird"
	fi
	if [ "$linuxDistro" == "SuSE" ]
	then
	    if [ -x /sbin/insserv ]
	    then
    		/sbin/insserv -d $scriptFile
	    elif [ -x /sbin/chkconfig ]
	    then
    		/sbin/chkconfig --add firebird
	    fi
	    # Other SuSE specific configuration
	    displayMessage "Adding Firebird to SuSE Run-level configuration Wizard..."
	    if [ -d /etc/sysconfig ] 
	    then
    		cp $currentDir/data/scripts/rc.config.firebird /etc/sysconfig/firebird
	    fi
	    if [ -x /bin/fillup ] && [ -e /etc/rc.config ]
	    then
    		/bin/fillup -d = -m /etc/rc.config $currentDir/data/scripts/rc.config.firebird
	    fi
	elif [ "$linuxDistro" == "SourceMage" ]
	then
    	    scriptFile="/etc/init.d/runlevels/%3/firebird"
	else
	    if [ -x /sbin/chkconfig ]
	    then
    		/sbin/chkconfig --add firebird
	    else
		displayMessage "Install can't find /sbin/chkconfig to configure initd." \
		"Please correct this problem manually" \
		"or use rcfirebird symlink to start/stop Firebird service when needed."
	    fi
	fi
	# Change run user and installation directory
	replaceSlashForED $installDir
	ed -s $scriptFile <<EOF > /dev/null
,s/FBRunUser=.*/FBRunUser=$installUser/g
,s/^FIREBIRD=.*/FIREBIRD=$result/g
w
q
EOF
	# Start Firebird server...
	displayMessage "Trying to start the Firebird server..."
	$scriptFile start
	if [ $? -ne 0 ]
	then
	    displayMessage "It seems that there is something wrong with Firebird" \
	    "startup script $scriptFile."
	fi
    fi
}

#------------------------------------------------------------------------
# Change SYSDBA password

changeSYSDBAPassword() {

    if [ "$SYSDBAPassword" != "masterkey" ]
    then
	displayMessage "Changing SYSDBA password..."
	$installDir/bin/gsec -user sysdba -password masterkey -modify sysdba -pw $SYSDBAPassword
	if [ -d /etc/rc.d/init.d ]
	then
	    scriptFile="/etc/rc.d/init.d/firebird"
	else
	    scriptFile="/etc/init.d/firebird"
	fi
	if [ -f $scriptFile ] 
	then
    	ed -s $scriptFile <<EOF > /dev/null
,s/{ISC_PASSWORD:=.*/{ISC_PASSWORD:=$SYSDBAPassword}/g
w
q
EOF
#    chmod u=rwx,g=rx,o= $scriptFile
	fi
    fi
}

#========================================================================
# Script control routines

#------------------------------------------------------------------------
# Ask for unspecified install options

askForInstallOptions() {

    result=0
    if [ "$pkgMain" == "Ask" ]
    then
	echo "Please, choose what you want to install:"
	echo ""
	echo "1) Firebird Super Server (including client)"
	echo "2) Firebird Classic Server (including client)"
	echo "3) Firebird client only"
	echo ""
	repeat=1
	while  [ $((repeat)) -eq 1 ]
	do
    	    echo -n "Choose 1, 2 or 3:"
    	    read answer rest
    	    repeat=0
    	    case $answer in
	    1)  
		pkgMain="Super Server" ;;
	    2)  
	        pkgMain="Classic" ;;
	    3)
		pkgMain="Client" 
		installUser="N/A"
		;;
    	    *)
		repeat=1 ;;
    	    esac
	done
	result=1
    fi
    if [ "$installIO" == "Ask" ] && [ "$pkgMain" != "Client" ]
    then
	AskYNQuestion "Do you want to install version with 64-bit file I/O ?"
	if [ $? -eq 0 ]
	then
    	    installIO="64"
	else
    	    installIO="32"
	fi
	result=1
    fi
    if [ "$pkgExamples" == "Ask" ]
    then
	AskYNQuestion "Do you want to install examples ?"
	if [ $? -eq 0 ]
	then
    	    pkgExamples="Yes"
	else
    	    pkgExamples="No"
	fi
	result=1
    fi
    if [ "$pkgLibraries" == "Ask" ]
    then
	AskYNQuestion "Do you want to install libraries ?"
	if [ $? -eq 0 ]
	then
    	    pkgLibraries="Yes"
	else
    	    pkgLibraries="No"
	fi
	result=1
    fi
    if [ "$pkgDoc" == "Ask" ]
    then
	AskYNQuestion "Do you want to install documentation ?"
	if [ $? -eq 0 ]
	then
    	    pkgDoc="Yes"
	else
    	    pkgDoc="No"
	fi
	result=1
    fi
    if [ "$pkgTools" == "Ask" ]
    then
	AskYNQuestion "Do you want to install additional tools ?"
	if [ $? -eq 0 ]
	then
    	    pkgTools="Yes"
	else
    	    pkgTools="No"
	fi
	result=1
    fi
    if [ "$uninstall" == "Ask" ]
    then
	AskYNQuestion "Do you want to create an uninstall script ?"
	if [ $? -eq 0 ]
	then
    	    uninstall="Yes"
	else
    	    uninstall="No"
	fi
	result=1
    fi
    if [ "$installUser" == "Ask" ]
    then
	AskYNQuestion "Do you want to run Firebird server as root ?"
	if [ $? -eq 0 ]
	then
    	    installUser="root"
	else
    	    AskQuestion "Please enter the OS user account name that Firebird should use:"
    	    installUser=$Answer
	fi
	result=1
    fi
    return $result
}

#------------------------------------------------------------------------
# Show help screen

showHelp() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	echo "Installation options:"
	echo ""
	echo "--help                This help"
	echo "--verbose             More verbose output"
	echo "--auto                Automatic (quiet) installation"
	echo "--super               Install Firebird Super Server"
	echo "                      Mutualy exclusive with --classic AND --client"
	echo "--classic             Install Firebird Classic Server"
	echo "                      Mutualy exclusive with --super AND --client"
	echo "--client              Install just Firebird Client"
	echo "                      Mutualy exclusive with --classic AND --super"
	echo "--all                 Install all optional Firebird packages"
#	echo "--IO32                Install version with 32-bit I/O"
#	echo "--IO64                Install version with 64-bit I/O"
	echo "--basic               Do not install any optional Firebird packages"
	echo "--doc                 Install documentation"
	echo "--nodoc               Do not install documentation"
	echo "--examples            Install examples"
	echo "--noexamples          Do not install examples"
	echo "--libs                Install development libraries and include files"
	echo "--nolibs              Do not install development libraries and include files"
	echo "--tools               Install additional tools"
	echo "--notools             Do not install additional tools"
	echo "--nouninstall         Do not produce an uninstallation script"
	echo "--port=num            Specify a port number"
	echo "--runas=user          Specify an user account to run the server"
	echo "--password=password   Set SYSDBA password to provided one"
	echo ""
    fi
    exit 1
}

#------------------------------------------------------------------------
# Display header

showHeader() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	clear
	echo "$CurrentVersion Installation"
	echo ""
    fi
}

#------------------------------------------------------------------------
# Display detected parameters

showDetected() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	echo ""
	echo "Linux distribution : $linuxDistro"
	echo "Service controler  : $serviceControler"
	echo ""

	if [ ! -z "$prevInstall" ] 
	then
	    echo "Previous installation of $prevInstall detected."
	    if [ ! -z "$prevInstallVersionString" ]
	    then
    		echo "Version $prevInstallVersionString"
	    fi
	    if [ ! -z "$prevInstallDir" ]
	    then
    		echo "Installed in $prevInstallDir"
	    fi
	    if [ ! -z "$installRPM" ]
	    then
    		echo "Installed by RPM package $installRPM"
	    fi
	    if [ ! -z "$prevPort" ]
	    then
    		echo "Configured to run on port $prevPort."
	    fi
	else
	    echo "No InterBase/Firebird installation detected."
	fi
    fi
}

#------------------------------------------------------------------------
# Display installation parameters

showInstallParameters() {

    if [ $((InteractiveInstall)) -gt 0 ]
    then
	echo "You requested to:"
	echo "Install type:           $pkgMain"
#	echo "I/O version:            $installIO"
	echo "Install Libraries:      $pkgLibraries"
	echo "Install Examples:       $pkgExamples"
	echo "Install Documentation:  $pkgDoc"
	echo "Install Tools:          $pkgTools"
	echo "Create Uninstall:       $uninstall" 
	echo "Run Firebird on port:   $installPort" 
	echo "Run Firebird as user:   $installUser" 
	echo "SYSDBA password:        $SYSDBAPassword"
	echo ""
    fi
}

#== Main Program ==========================================================

# Check if /etc/services already contain gds_db entry. We have to fix
# installPort according to /etc/services right now, before it's changed 
# by cmd-line option...

readPreviousPort
if [ ! -z "$prevPort" ]
then
    installPort="$prevPort"
fi

InteractiveInstall=1

for Option in $*
do
    if [ $Option == "--auto" ]
    then        
	InteractiveInstall=0 
    fi 
done

export InteractiveInstall

showHeader

# Process CLI options
  
for Option in $*
do
    OptionValue=`echo "$Option" | cut -d'=' -f2`
    OptionName=`echo "$Option" | cut -d'=' -f1`
    case $OptionName in
    --help)        
	showHelp ;;
    --auto)        
        InteractiveInstall=0 ;;
    --verbose)
        verbose=1 ;;
    --all)     
        pkgExamples="Yes"
        pkgLibraries="Yes"
        pkgDoc="Yes"
        pkgTools="Yes"
        ;;
    --basic)     
        pkgExamples="No"
        pkgLibraries="No"
        pkgDoc="No"
        pkgTools="No"
        ;;
### !!!
    --super)
        pkgMain="Super Server" 
	;; 
    --classic)
#        installUser="root"
        pkgMain="Classic" 
	;;
    --client)
        pkgMain="Client" 
        installUser="N/A"
	;;
#    --IO32)
#	installIO="32" ;;
#    --IO64)
#	installIO="64" ;;
    --examples)
        pkgExamples="Yes" ;;
    --noexamples)
        pkgExamples="No" ;;
    --doc)
        pkgDoc="Yes" ;;
    --nodoc)
        pkgDoc="No" ;;
    --libs)
        pkgLibraries="Yes" ;;
    --nolibs)
        pkgLibraries="No" ;;
    --tools)
        pkgTools="Yes" ;;
    --notools)
        pkgTools="No" ;;
    --uninstall)   
        uninstall="Yes" ;;
    --nouninstall)   
        uninstall="No" ;;
    --port)
        installPort=$OptionValue ;;
    --runas)
#        if [ "$pkgMain" == "Classic" ]
#	then
#	  displayExitMessage "Classic server must run as root." \
#	   "Install Super Server or ommit --runas option."
#	else
          installUser=$OptionValue 
#	fi
	;;
    --password)
	SYSDBAPassword=$OptionValue ;;
    *)             
        if [ $((InteractiveInstall)) -gt 0 ]
        then
          echo "**** Unknown switch $OptionName ****" 
	  echo ""
	else
          echo "**** Unknown switch $OptionName ****" 1>&2
	fi
	showHelp ;;
    esac 
done

# Basic detection
checkInstallUser

if [ $((InteractiveInstall)) -gt 0 ]
then
    echo "You're runnning this installation script in interactive mode,"
    echo "which will guide you through all necessary steps to install,"
    echo "configure and run Firebird SQL server and/or clients on this computer."
    echo ""
    echo "Checking environment, please wait..."
fi
checkPreviousInstallation
detectDistro
detectServiceControler

if [ $((InteractiveInstall)) -gt 0 ]
then
    showDetected
    if [ ! -z "$prevInstall" ] 
    then
	echo ""
	displayMessage "To proceed, the previous installation of $prevInstall" \
        "have to be removed. But don't worry, the security database and " \
        "other important files and configuration would be protected." \
        "Anyway, you can quit the installation process now or later by ^C"
	AskYNQuestion "Do you want to continue ?"
	if [ $? -ne 0 ]
	then
    	    exit 1
	else
    	    showHeader
	fi
    fi
    echo ""
    showInstallParameters
    echo ""
    echo "To list all options available for this script use --help option."
    echo ""
    askForInstallOptions
    if [ $? -eq 1 ] 
    then
	showHeader
	showDetected
	showInstallParameters
    fi
    AskQuestion "Press Enter to start installation or ^C to abort"
    echo ""
else
    # In AUTO mode, we have to check if all important options are set to run without questions
    showOptionName=0
    isValue=1
    error=0
    SSorCS="super OR --classic OR --client"
    IO32or64="IO32 OR --IO64"
    for Option in "$pkgMain" "$SSorCS" "$pkgLibraries" libs "$pkgDoc" doc "$pkgTools" tools \
    "$pkgExamples" examples "$uninstall" uninstall "$installUser" runas "$installIO" "$IO32or64" ;
    do 
	if [ $((isValue)) -eq 1 ]
	then
    	    isValue=0
    	    if [ "$Option" == "Ask" ]
    	    then
    		echo -n "In --auto mode you must provide the installation option --" 1>&2
		showOptionName=1
		error=1
    	    fi
	else
    	    isValue=1
    	    if [ $((showOptionName)) -eq 1 ]
    	    then
    		if [ "$Option" != "runas" ] && [ "$Option" != "$SSorCS" ]
		then
        	    echo "(no)$Option" 1>&2
		else
        	    echo "$Option" 1>&2
		fi
		showOptionName=0
    	    fi
	fi
    done
    if [ $((error)) -eq 1 ]
    then
	displayExitMessage "For complete list of options use --help option."
    fi
fi

if [ ! -z "$prevInstall" ] 
then
    stopServerIfRunning
    archivePriorConfiguration
    # As an additional safety net, we offer a full backup
    AskYNQuestion "Do you want a full backup of current installation ?"
    if [ $? -eq 0 ]
    then
	archivePriorInstallSystemFiles
    fi
    removePreviousInstallation  
else
    checkPort
fi

if [ "$installUser" != "N/A" ]
then
    createGroupAndUserAccount
fi

# Well, we're ready to install Firebird...

installPackages

# Post-install configuration

configureService
configureInitdScript
changeSYSDBAPassword

# Keep uninstall for user if requested

if [ "$uninstall" == "Yes" ]
then
  cp $currentDir/uninstall $installDir/uninstall
fi

# Final cleanup

rm $currentDir/uninstall
if [ -d $currentDir/data  ]
then
    rm -R $currentDir/data
fi

displayMessage "" "Installation completed."

#!/bin/sh


#------------------------------------------------------------------------
# Prompt for response, store result in Answer

Answer=""

AskQuestion() {
    Test=$1
    DefaultAns=$2
    echo -n "${1}"
    Answer="$DefaultAns"
    read Answer
}


#------------------------------------------------------------------------
#  stop super server if it is running
#  Also will only stop firebird, since that has the init script


stopServerIfRunning() {

    checkString=`ps -efww| egrep "(fbserver|fbguard|ibserver|ibguard)" |grep -v grep`

    if [ ! -z "$checkString" ] 
      then
        if [ -f /etc/init.d/firebird ]
          then
            /etc/init.d/firebird stop
        elif [ -f /etc/rc.d/init.d/firebird ]
          then
            /etc/rc.d/init.d/firebird stop
        fi
    fi
}

#------------------------------------------------------------------------
#  stop server if it is running


checkIfServerRunning() {


    stopServerIfRunning


    checkString=`ps -efww| egrep "(fbserver|fbguard|ibserver|ibguard)" |grep -v grep`

    if [ ! -z "$checkString" ] 
      then
        echo "An instance of the Firebird/InterBase Super server seems to be running." 
        echo "(the ibserver/ibguard/fbserver/fbguard process was detected running on your system)"
        echo "Please quit all Firebird applications and then proceed"
        exit -1 
    fi



    checkString=`ps -efww| egrep "(fb_inet_server|gds_inet_server)" |grep -v grep`

    if [ ! -z "$checkString" ] 
      then
        echo "An instance of the Firebird/InterBase Classic server seems to be running." 
        echo "Please quit all interbase applications and then proceed." 
        exit 1 
    fi



# Stop lock manager if it is the only thing running.

    for i in `ps -efww | egrep "[gds|fb]_lock_mgr" | awk '{print $2}' `
     do
        kill $i
     done


}


#------------------------------------------------------------------------
# Run process and check status


runAndCheckExit() {
    Cmd=$*

#    echo $Cmd
    $Cmd

    ExitCode=$?

    if [ $ExitCode -ne 0 ]
      then
        echo "Install aborted: The command $Cmd "
        echo "                 failed with error code $ExitCode"
        exit $ExitCode
    fi
}


#------------------------------------------------------------------------
#  Display message if this is being run interactively.


displayMessage() {

    msgText=$1
    if [ ! -z "$InteractiveInstall" ]
      then
        echo $msgText
    fi
}


#------------------------------------------------------------------------
#  Archive any existing prior installed files.
#  The 'cd' stuff is to avoid the "leading '/' removed message from tar.
#  for the same reason the DestFile is specified without the leading "/"


archivePriorInstallSystemFiles() {

    oldPWD=`pwd`
    archiveFileList=""

    cd /

    DestFile=${IBRootDir#/}   # strip off leading /
    if [ -e "$DestFile"  ]
      then
        echo ""
        echo ""
        echo ""
        echo "--- Warning ----------------------------------------------"
        echo "    The installation target directory: $IBRootDir"
        echo "    Already contains a prior installation of InterBase/Firebird."
        echo "    This and files found in /usr/include and /usr/lib will be"
        echo "    archived in the file : ${ArchiveMainFile}"
        echo "" 

        if [ ! -z "$InteractiveInstall" ]
          then
            AskQuestion "Press return to continue or ^C to abort"
        fi

        if [ -e $DestFile ]
          then
            archiveFileList="$archiveFileList $DestFile"
        fi
    fi


    for i in ibase.h ib_util.h
      do
        DestFile=usr/include/$i
        if [ -e $DestFile ]
          then
            archiveFileList="$archiveFileList $DestFile"
        fi
      done

    for i in libib_util.so libfbclient.so.1.5.0 libfbclient.so.1 libfbclient.so
      do
        DestFile=usr/lib/$i
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
          displayMessage "Deleting..."

          for i in $archiveFileList
            do
              rm -rf $i
            done

          displayMessage "Done."

      fi
    cd $oldPWD

}


#------------------------------------------------------------------------
#  Check for installed RPM package

checkForRPMInstall() {
    PackageName=$1

    rpm -q $PackageName
    STATUS=$? 
    if [ $STATUS -eq 0 ]
      then 
        echo "Previous version of $PackageName is detected on your system." 
        echo "this will conflict with the current install of Firebird"
        echo "Please unistall the previous version `rpm -q $PackageName` and then proceed." 
        exit $STATUS 
    fi 

}


#------------------------------------------------------------------------
#  Check for presence of editor 'ed'

checkForEd() {
    ed <<EOS >/dev/null 2>&1
EOS
    if [ $? -ne 0 ]
      then
	echo "+------------------- ERROR -----------------------+"
	echo "| Your system miss traditional unix editor 'ed'.  |"
	echo "| Please install it before running setup program. |"
	echo "+-------------------------------------------------+"
	exit 127
    fi
}


#== Main Pre =================================================================

    IBRootDir=/usr/firebird
    IBBin=$IBRootDir/bin
    ArchiveDateTag=`date +"%Y%m%d_%H%M"`
    ArchiveMainFile="${IBRootDir}_${ArchiveDateTag}.tar.gz"

    checkForEd
    
# Ok so any of the following packages are a problem
# these don't work at least in the latest rpm manager, since it 
# has the rpm database locked and it fails.

#    checkForRPMInstall InterBase
#    checkForRPMInstall FirebirdCS
#    checkForRPMInstall FirebirdSS


    checkIfServerRunning


# Failing that we archive any files we find

    archivePriorInstallSystemFiles


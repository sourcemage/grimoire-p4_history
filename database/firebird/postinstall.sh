#!/bin/sh
InteractiveInstall=""
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
# add a service line in the (usually) /etc/services or /etc/inetd.conf file
# Here there are three cases, not found         => add service line,
#                             found & different => ask user to check
#                             found & same      => do nothing
#                             

replaceLineInFile() {
    FileName=$1
    newLine=$2
    oldLine=$3
    Silent=$4

    if [ -z "$oldLine" ] 
      then
        echo "$newLine" >> $FileName

    elif [ "$oldLine" != "$newLine"  ]
      then
        if [ "$Silent" != "Silent" ]
	  then
            echo ""
	    echo "--- Warning ----------------------------------------------"
    	    echo ""
            echo "    In file $FileName found line: "
	    echo "    $oldLine"
    	    echo "    Which differs from the expected line:"
            echo "    $newLine"
	    echo ""
	fi

#        AskQuestion "Press return to update file or ^C to abort install"

        cat $FileName | grep -v "$oldLine" > ${FileName}.tmp
        mv ${FileName}.tmp $FileName
        echo "$newLine" >> $FileName
        echo "Updated $FileName."

    fi
}



#------------------------------------------------------------------------
#  changeInitPassword


changeInitPassword() {
  echo change init file
  NewPasswd=$1

  InitFile=/etc/init.d/runlevels/%3/firebird
#    if [ ! -f $InitFile ]
#      then
#	InitFile=/etc/init.d/firebird
#    fi

 if [ -f $InitFile ]
 then
   sed -e "s/ISC_PASSWORD=.*/ISC_PASSWORD=$NewPasswd/g" \
	-i $InitFile	    
#        ed $InitFile <<EOF
#/ISC_PASSWORD/s/ISC_PASSWORD=.*/ISC_PASSWORD=$NewPasswd/g
#w
#q
#EOF
    chmod u=rwx,g=rx,o= $InitFile
    echo changed $InitFile
    echo pw= $NewPasswd
  else
    echo no file: $InitFile
  fi
}

#---------------------------------
DefaultPassword()
{
  NewPasswd='masterkey'
  cat > $DBAPasswordFile <<EOF
Firebird initial install
password for user SYSDBA is : $NewPasswd
for install on `hostname` at time `date`
EOF

}

#------------------------------------------------------------------------
#  Generate new sysdba password - this routine is used only in the 
#  rpm file not in the install acript.


generateNewDBAPassword() {

    # openssl generates random data.
    if [ -f /usr/bin/openssl ]
      then
        NewPasswd=`openssl rand -base64 10 | cut -c1-8`
    fi
echo opensssl= $NewPasswd
    # mkpasswd is a bit of a hassle, but check to see if it's there
#    if [ -z "$NewPasswd" ]
#      then
#        if [ -f /usr/bin/mkpasswd ]
#          then
#            NewPasswd=`/usr/bin/mkpasswd -l 8`
#        fi
#    fi
rm -f $DBAPasswordFile

  if [ -z "$NewPasswd" ]
  then
    DefaultPassword

#        keepOrigDBAPassword
#        return
  else
#    fi
    
    NewPasswd=`echo $NewPasswd | awk '{ for(i=1; i<=8; i++) {x = substr($1, i, 1); if (x == "/") x = "_"; printf "%c", x }; print ""}'`
cat > $DBAPasswordFile <<EOF
Firebird generated password
for user SYSDBA is : $NewPasswd
generated on `hostname` at time `date`
EOF
  fi

}

#------------------------------------------------------------------------
#  Change sysdba password - this routine is interactive and is only 
#  used in the install shell script not the rpm one.


askUserForNewDBAPassword() {

    NewPasswd=""

    echo ""
    while [ -z "$NewPasswd" ]
      do
          AskQuestion "Please enter new password for SYSDBA user: "
          NewPasswd=$Answer
          if [ ! -z "$NewPasswd" ]
            then
             $IBBin/gsec -user sysdba -password masterkey <<EOF
modify sysdba -pw $NewPasswd
EOF
              echo ""
              changeInitPassword "$NewPasswd"
          fi
          
      done
}


#------------------------------------------------------------------------
#  Change sysdba password - this routine is interactive and is only 
#  used in the install shell script not the rpm one.

#  On some systems the mkpasswd program doesn't appear and on others
#  there is another mkpasswd which does a different operation.  So if
#  the specific one isn't available then keep the original password.


changeDBAPassword() {

  DefaultPassword

#    if [ -z "$InteractiveInstall" ]
#      then
#        generateNewDBAPassword
#      else
#        askUserForNewDBAPassword
#    fi
cat >> $DBAPasswordFile <<EOF

You should change this password at the earliest oportunity

(For superserver you will also want to check the password in the
daemon init routine in the file /etc/init.d/runlevels/%3/firebird)

Your password can be changed to a more suitable one using the
/usr/firebird/bin/gsec program as show below:"
  >cd /usr/firebird
  >bin/gsec -user sysdba -password <password>"
  GSEC>modify sysdba -pw <newpassword>
  GSEC>quit
EOF
    chmod u=r,go= $DBAPasswordFile
    chmod u=r,go= $DBAPasswordFile

    echo ""

#    echo Running gsec to modify SYSDBA password
#    $IBBin/gsec -user sysdba -password masterkey <<EOF
#modify sysdba -pw $NewPasswd
#EOF
##    echo ""
#    echo Now modifying /etc/init.d/runlevels/%3/firebird

    changeInitPassword "$NewPasswd"
}



#------------------------------------------------------------------------
# startInetService
# Now that we've installed it start up the service.

startInetService() {
echo do 'telinit enable firebird'
}


#------------------------------------------------------------------------
# UpdateHostsDotEquivFile
# The /etc/hosts.equiv file is needed to allow local access for super server
# from processes on the machine to port 3050 on the local machine.
# The two host names that are needed there are 
# localhost.localdomain and whatever hostname returns.

updateHostsDotFile() {

echo try to update $1
    hostEquivFile=$1 

    if [ ! -f $hostEquivFile ]
      then
        touch $hostEquivFile
        chown root:root $hostEquivFile
        chmod u=rw,go=r $hostEquivFile
    fi

    newLine="localhost"
    oldLine=`grep "^$newLine\$" $hostEquivFile`
    replaceLineInFile "$hostEquivFile" "$newLine" "$oldLine"

    newLine="localhost.localdomain"
    oldLine=`grep "^$newLine\$" $hostEquivFile`
    replaceLineInFile "$hostEquivFile" "$newLine" "$oldLine"

    newLine="`hostname`"
    oldLine=`grep "^$newLine\$" $hostEquivFile`
    replaceLineInFile "$hostEquivFile" "$newLine" "$oldLine"
echo done    
}



#= Main Post ===============================================================


    IBRootDir=/usr/firebird
    IBBin=$IBRootDir/bin
#    RunUser=root
    RunUser=firebird
    DBAPasswordFile=$IBRootDir/SYSDBA.password
    export IBRootDir
    export IBBin
    export RunUser
    export DBAPasswordFile


    # Update /etc/services ( done by sorcery)


    # Add entries to host.equiv & hosts.allow files

# sort this out later ||||||||||||||||||$$$$$$$$
    updateHostsDotFile /etc/hosts.equiv
    updateHostsDotFile /etc/hosts.allow
	
	
    # Get inetd to reread new init files.

#    if [ -f /var/run/inetd.pid ]
#      then
#        kill -HUP `cat /var/run/inetd.pid`
#    fi


#  cd $IBRootDir
#  changeDBAPassword

    # Set up Firebird for run with init.d (done by sorcery)
cat <<EOF
# now start the db server and change the password
  > telinit enable firebird  (SuperServer only)
# Change sysdba password
  > cd $IBRootDir
  bin/changeDBAPassword.sh
EOF


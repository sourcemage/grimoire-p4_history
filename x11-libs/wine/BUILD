(
# create directories
function create_windows_directories {
    echo "creating windows directories"
    for tdir in "$GLOBAL_CROOT" "$GLOBAL_CROOT/windows" "$GLOBAL_CROOT/windows/system" \
        "$GLOBAL_CROOT/windows/command" \
        "$GLOBAL_CROOT/windows/Start Menu" "$GLOBAL_CROOT/windows/Start Menu/Programs" \
        "$GLOBAL_CROOT/Program Files" "$GLOBAL_CROOT/Program Files/Common Files" \
        "$GLOBAL_CROOT/windows/Profiles" "$GLOBAL_CROOT/windows/Profiles/Administrator" \
        "$GLOBAL_CROOT/windows/Fonts" "$GLOBAL_CROOT/windows/Start Menu/Programs/Startup"
      do [ -d "$tdir" ] || mkdir "$tdir"
    done
    touch $GLOBAL_CROOT/autoexec.bat
    touch $GLOBAL_CROOT/config.sys
    touch $GLOBAL_CROOT/windows/win.ini
    touch $GLOBAL_CROOT/windows/system.ini
    install -c -m 644 $INFSCRIPT "$GLOBAL_CROOT/windows/system/wine.inf"
    
}

function link_app {
    ln -sf $LIBDIR/wine/$1.exe.so $2
}

#puts windows applications replacements to windows directories,
#configures them
function configure_wine_applications {
    link_app start        "$GLOBAL_CROOT/windows/command/start.exe"
    link_app notepad      "$GLOBAL_CROOT/windows/notepad.exe"
    link_app regedit      "$GLOBAL_CROOT/windows/regedit.exe"
    link_app rundll32     "$GLOBAL_CROOT/windows/rundll32.exe"
    link_app wcmd         "$GLOBAL_CROOT/windows/system/wcmd.exe"
    link_app control      "$GLOBAL_CROOT/windows/system/control.exe"
    link_app winhelp      "$GLOBAL_CROOT/windows/system/help.exe"
    link_app notepad      "$GLOBAL_CROOT/windows/system/notepad.exe"
    link_app progman      "$GLOBAL_CROOT/windows/system/progman.exe"
    link_app regsvr32     "$GLOBAL_CROOT/windows/system/regsvr32.exe"
    link_app winemine     "$GLOBAL_CROOT/windows/system/winmine.exe"
    link_app winver       "$GLOBAL_CROOT/windows/system/winver.exe"
    link_app uninstaller  "$GLOBAL_CROOT/windows/uninstall.exe"
    link_app winhelp      "$GLOBAL_CROOT/windows/winhelp.exe"
    link_app winhelp      "$GLOBAL_CROOT/windows/winhlp32.exe"
}

# fix wine build problem
LDFLAGS=${LDFLAGS//-z combreloc/}


[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

# Apply Red Hat patches
#
# Hopefully the next 3 patches will allow better global config
# global registry usage.
patch -p1 < $SCRIPT_DIRECTORY/wine-$VERSION-initial.patch &&
patch -p1 < $SCRIPT_DIRECTORY/wine-$VERSION-winelauncher.patch &&
patch -p1 < $SCRIPT_DIRECTORY/wine-$VERSION-defaultcfg.patch &&
# minor fix to wine/documentation/configuring.sgml
#patch -p1 < $SCRIPT_DIRECTORY/wine-$VERSION-documentation.patch &&

# fix config file
# changes the Drive C from /c to $CROOT 
cd $EXDIR &&
cp config config.org &&
sed -e "s:\"/c\":\"$CONFIG_CROOT\":g" config.org > config &&
# changes the Drive A from /mnt/fd0 to $AROOT 
cp config config.org &&
sed -e "s:\"/mnt/fd0\":\"$AROOT\":g" config.org > config &&
# changes the Drive D from /cdrom to $DROOT 
cp config config.org &&
sed -e "s:\"/cdrom\":\"$DROOT\":g" config.org > config &&
# changes the global registry location from /etc to $SYSCONFDIR
cp config config.org &&
sed -e "s:;\"GlobalRegistryDir\" = \"/etc\";:;\"GlobalRegistryDir\" = \"$SYSCONFDIR\";:g" config.org > config &&

cd $SOURCE_DIRECTORY &&

# Actual compiling of source

   ./configure  --prefix=$PREFIX		\
		--sysconfdir=$SYSCONFDIR	\
		--bindir=$BINDIR		\
		--libdir=$LIBDIR		\
		--localstatedir=/var		\
		--mandir=$PREFIX/share/man	\
		--infodir=$PREFIX/share/info	\
                --with-x                        \
		$OPTS			&&

  make depend				&&
  make					&&
#
# needs added dependencies to work
# according to the fedora src.rpm
# we need 'docbook-utils' and 'docbook-utils-pdf'
#
#  make  -C documentation doc            &&

# Installation
  prepare_install			&&
  make install				&&

  create_windows_directories 		&&
  configure_wine_applications 		&&
if [ "$GLOBAL_C" == "y" ]; then
    chgrp -R users $GLOBAL_CROOT 	&&
    chmod -R g+w $GLOBAL_CROOT
fi					&&

install -m0644 programs/winemenubuilder/wine.xpm ${INSTALL_ROOT}/usr/share/pixmaps/

) > $C_FIFO 2>&1

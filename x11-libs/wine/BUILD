(

[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

# fix config file
# changes the Drive C to from /c to $CROOT 
cd $EXDIR &&
cp config config.org
sed -e "s:\"/c\":\"$CROOT\":g" \
config.org > config &&
cp config config.org
sed -e "s:\"/mnt/fd0\":\"$AROOT\":g" \
config.org > config &&
cp config config.org
sed -e "s:\"/cdrom\":\"$DROOT\":g" \
config.org > config &&


cd $SOURCE_DIRECTORY &&
# Actual compiling of source

  ./configure	--prefix=$PREFIX		\
		--sysconfdir=$SYSCONFDIR	\
		--bindir=$BINDIR		\
		--libdir=$LIBDIR		\
		--localstatedir=/var		\
		--mandir=$PREFIX/share/man	\
		--infodir=$PREFIX/share/info	\
		$OPTS			&&

  make depend				&&
  make					&&

# Installation
  prepare_install			&&
  make install				&&

# Install global config file and Registry

# create directories
function create_windows_directories {
    echo "creating windows directories"
    for tdir in "$CROOT" "$CROOT/windows" "$CROOT/windows/system" \
	"$CROOT/windows/command" \
	"$CROOT/windows/Start Menu" "$CROOT/windows/Start Menu/Programs" \
	"$CROOT/Program Files" "$CROOT/Program Files/Common Files" \
	"$CROOT/windows/Profiles" "$CROOT/windows/Profiles/Administrator" \
	"$CROOT/windows/Fonts" "$CROOT/windows/Start Menu/Programs/Startup"
      do [ -d "$tdir" ] || mkdir "$tdir"
    done
    [ -f "$CROOT/windows/win.ini" ]    || cp "$WININI"    "$CROOT/windows/win.ini"
    [ -f "$CROOT/windows/system.ini" ] || cp "$SYSTEMINI" "$CROOT/windows/system.ini"
}

function link_app {
    ln -sf $LIBDIR/wine/$1.exe.so $2
}

#puts windows applications replacements to windows directories,
#configures them
function configure_wine_applications {
    link_app start        "$CROOT/windows/command/start.exe"
    link_app notepad      "$CROOT/windows/notepad.exe"
    link_app regedit      "$CROOT/windows/regedit.exe"
    link_app rundll32     "$CROOT/windows/rundll32.exe"
    link_app wcmd         "$CROOT/windows/system/wcmd.exe"
    link_app control      "$CROOT/windows/system/control.exe"
    link_app winhelp      "$CROOT/windows/system/help.exe"
    link_app notepad      "$CROOT/windows/system/notepad.exe"
    link_app progman      "$CROOT/windows/system/progman.exe"
    link_app regsvr32     "$CROOT/windows/system/regsvr32.exe"
    link_app winemine     "$CROOT/windows/system/winmine.exe"
    link_app winver       "$CROOT/windows/system/winver.exe"
    link_app uninstaller  "$CROOT/windows/uninstall.exe"
    link_app winhelp      "$CROOT/windows/winhelp.exe"
    link_app winhelp      "$CROOT/windows/winhlp32.exe"
}

create_windows_directories &&
configure_wine_applications &&
chgrp -R users $CROOT &&
chmod -R g+w $CROOT

) > $C_FIFO 2>&1
# change libtool, which is stupidly embedded in the package:
if (gaze installed libtool &>/dev/null) then
	cp /usr/bin/libtool $SOURCE_DIRECTORY
	cp /usr/share/libtool/ltmain.sh $SOURCE_DIRECTORY/auxdir
fi

default_build

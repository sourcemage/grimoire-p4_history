(
	patch -p1 < $SOURCE_CACHE/$SOURCE2   &&
#the easy way thanks to alley_cat
#export LDFLAGS="-L/usr/lib/python2.3/config $LDFLAGS"
#the hard way which i did before finding out Arwed had filed a bug
sedit '/PY_PATH=/d' configure.in &&
sedit '/PY_VERSION=/a\
                    \PY_PATH=lib/python$(gaze installed Python| cut -d. -s -f1-3 | cut -c-3)\' configure.in && 
./autogen.sh  &&
	default_build
) > $C_FIFO 2>&1

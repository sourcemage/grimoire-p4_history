patch -p0 < $SCRIPT_DIRECTORY/openal-build-patch0.diff  &&
patch -p0 < $SCRIPT_DIRECTORY/openal-no-march.patch     &&

rm -rf `find -type d -name CVS`                         &&

cd linux                                                &&
sh ./autogen.sh                                         &&
./configure --enable-waveout                            \
            --enable-null                               \
            --enable-capture                            \
            --enable-jlib                               \
            --enable-fft                                \
            --disable-alsa                              \
            --enable-optimization                       \
            --prefix=/usr                               \
            $OPTS                                       &&
make

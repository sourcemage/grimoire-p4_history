if [ "$GETCVS" == "n" -a "$GETSNAP" == "n" -a "$(installed_version gcc | cut -d . -f 1,2)" == "3.4" ]; then
   patch -p1 < $SCRIPT_DIRECTORY/wvstreams-gcc34.patch
fi &&

# Until the fftw2 error gets fixed, comment this out if
# you want to see if it will build on your system.
OPTS="$OPTS --without-fftw" &&

# Use spell xplc instead of xplc in tarball
OPTS="$OPTS --with-xplc=/usr" &&

default_build

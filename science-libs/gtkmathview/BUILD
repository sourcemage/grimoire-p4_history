if [ "$( installed_version gcc | cut -d . -f 1,2 )" == "3.4" ]; then
   patch -p0 < $SCRIPT_DIRECTORY/templatebuilder.hh.diff
fi &&

default_build

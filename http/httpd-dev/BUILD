# these modules are not enabled by default and not part of any dependency
HTTPD_MODULES=$(cat $SCRIPT_DIRECTORY/enable-modules | while read m; do echo -n " --enable-$m=shared"; done) &&

OPTS="$OPTS --with-mpm=${HTTPD_MPM:-worker} --enable-so=static --enable-layout=GNU" &&
default_build

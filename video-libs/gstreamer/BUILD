patch  -p1  <  $SCRIPT_DIRECTORY/gtk-doc-fix.patch      &&
export OPTS="$OPTS --disable-examples --disable-tests"  &&
sedit  's:-Werror::'  configure  &&
default_build

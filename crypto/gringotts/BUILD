sedit 's:-DGTK_DISABLE_DEPRECATED::'  src/Makefile.in  &&
if [ "$ROOT_FILTER" == "y" ]; then
  OPTS="$OPTS --enable-root-filter"
fi  &&
if [ "$ENV_CHECK" == "n" ]; then
  OPTS="$OPTS --disable-env-check"
fi  &&
default_build

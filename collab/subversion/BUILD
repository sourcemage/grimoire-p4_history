# -*- mode: shell-script; -*-

## conditionally run `make' if SWIG dependency is on
## @usage <1:make target>
function make_if_swig() {
  if echo "$OPTS" | grep -q 'with-swig'; then
    make $1
  fi
}

(

  SVN_CLIENT=$(which svn 2>/dev/null)

  message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
  httpd -v | grep -q 'Apache/2\.'                                   &&

  message "${MESSAGE_COLOR}Checking for mod_dav.so Apache module${DEFAULT_COLOR}" &&
  if ! [ -e /usr/libexec/mod_dav.so ] && ! httpd -l | grep -q 'mod_dav\.c'; then
    false
  fi &&

  if [ "$SVN_EXPORT_HEAD" == 'y' ]; then
#   Client executable may be available but not working, so we need an extra check
    if [ -z "$SVN_CLIENT" ] || ! $SVN_CLIENT --version >/dev/null 2>&1; then
      message "${MESSAGE_COLOR}Subversion will build a client to bootstrap to the Subversion project${DEFAULT_COLOR}" &&
      message "${MESSAGE_COLOR}repository and check out the latest client and Apache 2 module source${DEFAULT_COLOR}" &&
      message "${MESSAGE_COLOR}code. Then, these will be built and installed.${DEFAULT_COLOR}"                        &&

#     Build static client to bootstrap to repository
      ./configure                \
        --build=$BUILD           \
        --prefix=/usr            \
        --sysconfdir=/etc        \
        --localstatedir=/var     \
        --disable-shared         \
        --disable-dso            \
        --without-apxs           \
        --enable-maintainer-mode &&
      make                       &&

      SVN_CLIENT=$(pwd)/subversion/clients/cmdline/svn
    fi &&

#   Download HEAD revision
    message "${MESSAGE_COLOR}Using client: ${SVN_CLIENT}${DEFAULT_COLOR}" &&
    $SVN_CLIENT --version | head -2 &&
    $SVN_CLIENT \
      --non-interactive \
      --no-auth-cache \
      export \
      http://svn.collab.net/repos/svn/trunk \
      trunk-HEAD &&
    cd trunk-HEAD
  fi &&

#
# -=* ACTUAL BUILD *=-
#

  message "${MESSAGE_COLOR}Starting actual build...${DEFAULT_COLOR}" &&

  if ! [ -x configure ]; then ./autogen.sh; fi &&
  ./configure \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --disable-static \
    --enable-dso \
    --disable-mod-activation \
    --enable-shared \
    --with-apxs \
    $OPTS &&
  make &&
  make_if_swig swig-py &&

# Use this instead of just 'make' for -jN option:
# make -jN external-all
# make -jN local-all

# Test if built from current source
  if [ "$SVN_EXPORT_HEAD" == 'y' ] && spell_installed Python; then
    make check
  fi

# Install
  prepare_install &&
  make install &&
  make_if_swig install-swig-py

) >$C_FIFO 2>&1 && (

  cp $SCRIPT_DIRECTORY/svn.conf.default /etc/httpd/

)

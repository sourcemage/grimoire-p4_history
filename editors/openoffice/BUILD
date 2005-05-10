#------------------------------------------------------
##
## Force the system to use gcc33
##
## I really don't understand what this code does.
##
## Copied from libgcc2 from sorcery
##
##
#------------------------------------------------------


#---------------------------------------------------------------------
## @param new path to add
## @param old path
## @Stdout new path
## Echos the old path with new path prepended, separated with a ':'
#---------------------------------------------------------------------
function gcc33_prepend_path()  {

  if    test  -z  $2
  then  echo $1
  else  echo $1:$2
  fi

}

#---------------------------------------------------------------------
## @param path
##
## Alters the environment so that gcc33 will be used for compiling and
## building spells when the "gcc" command is used.
##
#---------------------------------------------------------------------
function gcc33_add_paths()  {

  export  PATH=$(  gcc33_prepend_path  $1/bin  $PATH  )
  export  LD_LIBRARY_PATH=$(  gcc33_prepend_path  $1/lib  $LD_LIBRARY_PATH  )
  export  LD_RUN_PATH=$(  gcc33_prepend_path  $1/lib  $LD_RUN_PATH  )
  export  INFOPATH=$(  gcc33_prepend_path  $1/info  $INFOPATH  )
  export  CPPFLAGS="-I $1/include  $CPPFLAGS"

}

if [ "$OPENOFFICE_VERSION" == "stable" ]; then
gcc33_add_paths  /opt/gcc33
echo  "Using gcc version: `gcc  -dumpversion`"
fi

#---------------------------------------------------------------------
##
## End Messy USEGCC33 hack
##
#---------------------------------------------------------------------


### configure
	cd $SOURCE_DIRECTORY/config_office/               &&
	export CXXFLAGS="${CXXFLAGS} -I/usr/X11R6/include -I/usr/include/nspr -I/usr/include/nss"       &&
export CFLAGS="${CFLAGS} -I/usr/include/nspr -I/usr/include/nss" &&

echo OPTS=$OPTS &&
	./configure                                       \
		--with-lang=${LANGUAGE}                   \
		--with-dict=${DICTIONARY}                  \
		--prefix=${INSTALL_ROOT}/usr              \
		--sysconfdir=${INSTALL_ROOT}/etc          \
		--localstatedir=${INSTALL_ROOT}/var       \
                --mandir=${INSTALL_ROOT}/usr/share/man    \
                --infodir=${INSTALL_ROOT}/usr/share/info  \
		$OPENOFFICE_OPTS $OPTS                    &&

	cd $SOURCE_DIRECTORY &&
#sedit  "s:setenv LINK \"gcc\":&\nsetenv CFLAGS \"$CFLAGS\"       \
#          \nsetenv CXXFLAGS \"$CXXFLAGS\":"   LinuxIntelEnv.Set  &&

  ./bootstrap                                                                       &&
  tcsh -c "source LinuxIntelEnv.Set && \
           env && \
           dmake" &&
if [ "$OPENOFFICE_VERSION" == "stable" ]; then
  cd $SOURCE_DIRECTORY/instsetoo/unxlngi4.pro/01/normal	                            &&
  sedit "s:oo_home=OpenOffice.org${VERSION}:oo_home=openoffice:" install                 &&
  chmod +x install
else
echo "build done"
fi
patch  -p0 <$SCRIPT_DIRECTORY/Makefile.patch  &&
cp -v ${SCRIPT_DIRECTORY}/udev_logger.c ${SOURCE_DIRECTORY} &&
make prefix=${INSTALL_ROOT}/ exec_prefix=${INSTALL_ROOT}/ V=true ${OPTS}  &&
make -C extras/run_directory prefix=${INSTALL_ROOT}/ exec_prefix=${INSTALL_ROOT}/ LDFLAGS="${LDFLAGS} -lc"

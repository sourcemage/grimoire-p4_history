message "${MESSAGE_COLOR} Applying Makefile patch ${DEFAULT_COLOR}"
gzip -d < ${SCRIPT_DIRECTORY}/Makefile.patch.gz | patch -p1      &&
make &&
prepare_install &&
make install

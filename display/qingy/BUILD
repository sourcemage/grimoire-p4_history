sedit "s/\/etc\/X11\/Sessions/\/usr\/share\/xsessions/g" configure     &&
cp ${SCRIPT_DIRECTORY}/inittab.qingy ${INSTALL_ROOT}/etc/              &&
cp ${INSTALL_ROOT}/etc/pam.d/login ${SOURCE_DIRECTORY}/media/pam/qingy &&
OPTS="$OPTS --with-themes-dir=/etc/qingy/themes"
default_build

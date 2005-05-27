message "${MESSAGE_COLOR}SQLite 3 required${DEFAULT_COLOR}" &&
SQLITE=$(installed_version sqlite) &&
[[ "${SQLITE%%.*}" -ge 3 ]] &&

scons PREFIX=/usr CCFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" &&
scons PREFIX=/usr CCFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS"

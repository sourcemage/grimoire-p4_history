OPTS="$OPTS --build=${BUILD}"
[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST}"

if use_gcc 4.0
then
	CFLAGS="${CFLAGS/-O3/-O2}"
fi &&
gzip -cd $SPELL_DIRECTORY/wget-filter-controls.patch.gz |
patch -p1 && 

  ./configure --prefix=${TRACK_ROOT}/usr  \
          --sysconfdir=${TRACK_ROOT}/etc  \
       --localstatedir=${TRACK_ROOT}/var  \
              --mandir=${TRACK_ROOT}/usr/share/man   \
             --infodir=${TRACK_ROOT}/usr/share/info  \
                       $OPTS                 &&
  make DESTDIR=$INSTALL_ROOT


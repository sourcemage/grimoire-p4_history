(
    
    case $MOZILLA_MAIL  in
	n|N)	OPTS="$OPTS --disable-mailnews"
	    ;;
    esac &&

    case $MOZILLA_CHAT  in
	n|N)	OPTS="$OPTS --disable-chat"
	    ;;
    esac &&

    case $MOZILLA_JAVA  in
	y|Y|j|J)	OPTS="$OPTS --enable-java-supplement"
	    ;;
    esac &&

  case $MOZILLA_SVG in
  y|Y|j|J)
    OPTS="$OPTS --enable-svg"         &&
    export MOZ_INTERNAL_LIBART_LGPL=1
    ;;
  esac &&

    case $MOZILLA_MATHML  in
	n|N)	OPTS="$OPTS --disable-mathml"
	    ;;
    esac &&

    case $MOZILLA_XINERAMA  in
	y|Y|j|J)	OPTS="$OPTS --enable-xinerama"
	    ;;
    esac &&

  # PSM is usually needed, so it will compile except when disabled explicitly
  # This precaution is made for cases where CONFIGURE doesn't run for some reason
  case $MOZILLA_CRYPTO in
  n|N)
    ;;
  *)
    OPTS="$OPTS --enable-crypto"
    ;;
  esac &&

  case $MOZILLA_LDAP in
  y|Y|j|J)
    OPTS="$OPTS --enable-ldap"
    ;;
  esac &&

  ./configure                   \
    --prefix=/usr		\
    --with-x                    \
    --with-pthreads             \
    --enable-reorder            \
    --enable-strip              \
    --enable-optimize="$CFLAGS"	\
    --disable-debug             \
    --disable-tests             \
    --disable-installer         \
    $OPTS                       &&
  make                          &&

  case $MOZILLA_CRYPTO in
  y|Y|j|J)
    pushd security/manager &&
    make                   &&
    popd
    ;;
  esac &&

  case $MOZILLA_ENIGMAIL in
  y|Y|j|J)
    pushd extensions/ipc      && make && popd &&
    pushd extensions/enigmail && make && popd
    ;;
  esac &&

  prepare_install

) > $C_FIFO 2>&1 && (

  rm     -f                          /usr/lib/mozilla/component.reg
  mkdir  -p                          /usr/lib/mozilla
  cp     -rL  dist/bin/*             /usr/lib/mozilla/
  mkdir  -p                          /usr/include/mozilla
  cp	 -rL  dist/include/*         /usr/include/mozilla/
  mkdir  -p                          /usr/include/moznss
  cp     -L   dist/public/security/* /usr/include/moznss/

  sedit "s/mozilla-$VERSION/mozilla/g" build/unix/mozilla-gtkmozembed.pc
  sedit "s/mozilla-$VERSION/mozilla/g" build/unix/mozilla-js.pc
  sedit "s/mozilla-$VERSION/mozilla/g" build/unix/mozilla-nspr.pc
  sedit "s/mozilla-$VERSION/mozilla/g" build/unix/mozilla-nss.pc
  sedit "s/mozilla-$VERSION/mozilla/g" build/unix/mozilla-xpcom.pc
  cp build/unix/*.pc /usr/lib/pkgconfig/

  for  library  in  /usr/lib/mozilla/*.so;  do 
    libname=`basename  $library`
    ln  -sf  mozilla/$libname /usr/lib/$libname
  done

  cp  $SCRIPT_DIRECTORY/mozilla  /usr/bin/mozilla

  export  MOZILLA_FIVE_HOME=/usr/lib/mozilla
  export    LD_LIBRARY_PATH=/usr/lib/mozilla:$LD_LIBRARY_PATH

         /usr/lib/mozilla/regxpcom
         /usr/lib/mozilla/regchrome
  touch  /usr/lib/mozilla/chrome/user-skins.rdf
  touch  /usr/lib/mozilla/chrome/user-locales.rdf

  mkdir  -p /usr/lib/mozilla/plugins

)

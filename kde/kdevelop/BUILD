if  ${INSTALL_ROOT}/lib/libc.so.6  |  grep  -q  NPTL;  then
   sedit  "s/X_CFLAGS -ldb/X_CFLAGS -ldb -lpthread/"  configure 
fi  &&

OPTS="$OPTS  --enable-autoproject     \
             --enable-scriptproject   \
             --enable-trollproject    \
             --enable-customproject"  &&

source  $SCRIPT_DIRECTORY/../KDE_BUILD

#make  -Wno-deprecated                      

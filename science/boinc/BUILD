if [[ $BOINC_PARTS == client || $BOINC_PARTS == both ]]
then
  OPTS="$OPTS --enable-client"
fi &&
if [[ $BOINC_PARTS == server || $BOINC_PARTS == both ]]
then
  OPTS="$OPTS --enable-server"
fi &&
OPTS="$OPTS --with-gnu-ld"
default_build

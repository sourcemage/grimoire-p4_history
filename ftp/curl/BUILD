# OPTS="$OPTS --without-krb4" # this breaks configure but I'll leave
# it in as a reminder krb4 isn't enabled unless explicitly
# enabled and passed a library path anyways.

patch -d $SOURCE_DIRECTORY -p0 < $SPELL_DIRECTORY/http-ntlm.patch &&
default_build

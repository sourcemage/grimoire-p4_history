# this should use get_spell_provider to check which provider the user chose,
# but that function isn't in stable sorcery yet
# default to using mozilla if both mozilla and firefox are installed, building
# against firefox results in less features
if spell_ok mozilla; then
   OPTS="$OPTS --with-mozilla=mozilla"
else
   OPTS="$OPTS --with-mozilla=firefox"
fi &&

default_build

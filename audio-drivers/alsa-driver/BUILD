# Clean out the old alsa drivers.
rm  -f  /lib/modules/`installed_version linux-new`/misc/snd*  &&

modprobe  -q  soundcore  &&
sedit  "s:/usr/bin/awk:/bin/awk:"  utils/convert_isapnp_ids  &&
sedit  "s: install-scripts : :"    Makefile                  &&
sedit  "s:root.root:root.audio:"   snddevices                &&

./configure  --prefix=/usr         \
             --with-isapnp=yes     \
             --with-sequencer=yes  \
             --with-oss=yes        \
             --with-debug=none     \
             --with-cards=$CARDS   \
             $OPTS                 &&
make_single                        &&
make

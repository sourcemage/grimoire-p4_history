mconf()  {

  cat  <<  EOF
options	snd	snd_device_gid=29 snd_device_mode=0660 snd_cards_limit=1

alias	char-major-116		snd
alias	char-major-14		soundcore

alias	snd-card-0		snd-$CARD
alias	sound-slot-0		snd-card-0

alias	sound-service-0-0	snd-mixer-oss
alias	sound-service-0-1	snd-seq-oss
alias	sound-service-0-3	snd-pcm-oss
alias	sound-service-0-8	snd-seq-oss
alias	sound-service-0-12	snd-pcm-oss

# post-install	snd-card-0	/usr/sbin/alsactl  restore
EOF

}


# Clean out the old alsa drivers.
rm  -f  /lib/modules/`installed_version linux-new`/misc/snd*

(
  rm  include/linux/isapnp.h  &&
  touch  include/linux/modversions.h  &&

  modprobe  soundcore
  ./configure  --prefix=/usr         \
               --with-isapnp=yes     \
               --with-sequencer=yes  \
               --with-oss=yes        \
               --with-debug=none     \
               --with-cards=$CARD    \
               $OPTS                 &&
  make                               &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  make    install
  ./snddevices
  rm  -f   /dev/snd
  ln  -sf  /devices/snd  /dev/snd
  chown root.audio /dev/adsp
  chown root.audio /dev/amidi
  chown root.audio /dev/audio
  chown root.audio /dev/dsp
  chown root.audio /dev/midi
  chown root.audio /dev/mixer
  chown root.audio /dev/sequencer2
  chown root.audio /dev/snd
  ln  -sf  ../init.d/alsasound  /etc/rcS.d/S99alsasound
 
  if  [  !  -f   /etc/modules.d/alsa  ];  then
    mkdir   -p   /etc/modules.d
    mconf   >    /etc/modules.d/alsa
    touch        /etc/modules.d/alsa
  fi

  MOD="/etc/modules.conf"
  INC="include  /etc/modules.d/alsa"

  grep    -q  "$INC"      $MOD  ||
  echo        "$INC"  >>  $MOD
  depmod  -a
  true

)

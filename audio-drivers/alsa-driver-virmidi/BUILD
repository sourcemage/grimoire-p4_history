. /etc/sysconfig/devices

mconf()  {

  cat  <<  EOF
options	snd	device_mode=0777 cards_limit=2

alias	char-major-116		snd
alias	char-major-14		soundcore

alias	snd-card-0		snd-$CARD
alias	sound-slot-0		snd-card-0

alias	sound-service-0-0	snd-mixer-oss
alias	sound-service-0-1	snd-seq-oss
alias	sound-service-0-3	snd-pcm-oss
alias	sound-service-0-8	snd-seq-oss
alias	sound-service-0-12	snd-pcm-oss

# Configure card 1 (second card) as a virtual MIDI card
alias sound-slot-1 snd-card-1
alias snd-card-1 snd-virmidi

# post-install	snd-card-0	/usr/sbin/alsactl  restore
EOF

}


# Clean out the old alsa drivers.
rm  -f  /lib/modules/`installed_version linux-new`/misc/snd*

(

  modprobe  -q  soundcore
  sedit  "s:/usr/bin/awk:/bin/awk:"  utils/convert_isapnp_ids  &&
  sedit  "s: install-scripts : :"    Makefile  &&
  sedit  "s:root.root:root.audio:"   snddevices &&

  ./configure  --prefix=/usr         \
	       --with-kernel=/usr/src/linux \
               --with-isapnp=yes     \
               --with-sequencer=yes  \
               --with-oss=yes        \
               --with-debug=none     \
               --with-cards=$CARD,virmidi   \
               $OPTS                 &&
  make                               &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  make    install
  if [ $DEVICES == /devices ]; then
    ./snddevices
    rm  -f   /dev/snd
    ln  -sf  /devices/snd  /dev/snd
    chown root.audio /dev/adsp
    chmod  0777  /dev/adsp
    chown root.audio /dev/amidi
    chmod  0777  /dev/amidi
    chown root.audio /dev/audio
    chmod  0777  /dev/audio
    chown root.audio /dev/dsp
    chmod  0777  /dev/dsp
    chown root.audio /dev/midi
    chmod  0777  /dev/midi
    chown root.audio /dev/mixer
    chmod  0777  /dev/mixer
    chown root.audio /dev/sequencer2
    chmod  0777  /dev/sequencer2
    chown root.audio /dev/snd
    chmod  0777  /dev/snd
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
  fi
)

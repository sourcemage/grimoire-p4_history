. /etc/sysconfig/devices

# Clean out the old alsa drivers.
rm  -f  /lib/modules/`installed_version linux-new`/misc/snd*

mconf()
{
    # arbitrary, but I can't imagine a system with more 
    # than 6 *different* audio cards !
    for i in `seq 6` ;   
      do C=`echo snd-$CARDS | sed s/\,/\,snd-/g | cut -d, -f${i}` ;
      if [ -n "$C" ] ;
	  then
	  echo  "alias snd-card-`expr $i - 1` $C">>/etc/modules.d/alsa 
	  echo  "alias snd-slot-`expr $i - 1` snd-card-`expr $i - 1`">>/etc/modules.d/alsa
      fi ;
    done
    
    cat >> /etc/modules.d/alsa <<EOF
alias /dev/mixer snd-mixer-oss
alias /dev/dsp snd-pcm-oss
alias /dev/midi snd-seq-oss
EOF
    
}

(
    
    modprobe  -q  soundcore
    sedit  "s:/usr/bin/awk:/bin/awk:"  utils/convert_isapnp_ids  &&
    sedit  "s: install-scripts : :"    Makefile  &&
    sedit  "s:root.root:root.audio:"   snddevices &&
    
    ./configure  --prefix=/usr         \
	--with-kernel=/lib/modules/$(uname -r)/build \
	--with-isapnp=yes     \
	--with-sequencer=yes  \
	--with-oss=yes        \
	--with-debug=none     \
	--with-cards=$CARDS   \
	$OPTS                 &&
    make                               &&
    prepare_install		     &&
    make install			     &&
    ./snddevices
    rm  -f   /dev/snd
    ln  -sf  /devices/snd  /dev/snd
    chown root.audio /dev/adsp
    chmod 777 /dev/adsp
    chown root.audio /dev/amidi
    chmod 777 /dev/amidi
    chown root.audio /dev/audio
    chmod 777 /dev/audio
    chown root.audio /dev/dsp
    chmod 777 /dev/dsp
    chown root.audio /dev/midi*
    chmod 777 /dev/midi*
    chown root.audio /dev/mixer
    chmod 777 /dev/mixer
    chown root.audio /dev/sequencer*
    chmod 777 /dev/sequencer*
    chown root.audio /dev/snd
    chmod 777 /dev/snd
    chown root.audio /devices/snd/*
    chmod 777 /devices/snd/*
    if  [  !  -f   /etc/modules.d/alsa  ];  then
	mkdir   -p   /etc/modules.d
	mconf    
	touch        /etc/modules.d/alsa
    fi
    MOD="/etc/modules.conf"
    INC="include  /etc/modules.d/alsa"
    
    grep    -q  "$INC"      $MOD  ||
    echo        "$INC"  >>  $MOD
    depmod  -a
    true
    
) > $C_FIFO 2>&1  

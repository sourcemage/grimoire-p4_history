sedit  "s/HAVE_SLN=no/HAVE_SLN=yes/"   MCONFIG
sedit  "s/# ADD_RAW=yes/ADD_RAW=yes/"  MCONFIG
sedit  "s/\$(OPT)//"                   MCONFIG
(

  patch  -p1  < cryptoapi-2.4.7.0/doc/util-linux-2.11b.patch

 ./configure  --build=$BUILD           \
              --prefix=/usr            &&
  make                                 &&
  if    spell_installed      util-linux
  then  dispel  --nosustain  util-linux
  fi                                   &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&

if  !  [  -x  /etc/init.d/bootmisc.sh  ];  then
  cp  $SCRIPT_DIRECTORY/bootmisc.sh  /etc/init.d
fi

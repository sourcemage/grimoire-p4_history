sedit  "s/HAVE_SLN=no/HAVE_SLN=yes/"   MCONFIG
sedit  "s/\$(OPT)//"                   MCONFIG
(

 ./configure  --build=$BUILD           \
              --prefix=/usr            &&
  make                                 &&
  (
  if    spell_installed      util-linux
  then  dispel  --nosustain  util-linux
  fi                                   &&
  prepare_install
  ) &&
  make    install

) > $C_FIFO 2>&1  &&

if  !  [  -x  /etc/init.d/bootmisc.sh  ];  then
  cp  $SCRIPT_DIRECTORY/bootmisc.sh  /etc/init.d
fi

cfg()
{
  cat <<EOF
  $PCMCIA
  $PCI9052
  $ISL3874
  $ISL3873
EOF
}


patch -p0 < $SPELL_DIRECTORY/mk.diff etc/Makefile			&&
sedit "s:/local::" man/Makefile					&&
sedit "s:/usr/src/linux:/lib/modules/$(uname -r)/build:" config.in	&&
cfg |  make config		&&
make all 		

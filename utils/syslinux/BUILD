#gcc3.3 has a problem with this comment ?
sedit "s/# This is the setup header, and it must start at %cs:2 (old 0x9020:2)/\/# This is the setup \
header, and it must start at %cs:2 (old 0x9020:2)\//g" memdisk/init.S16 &&
sedit "s/# flags, unused bits must be zero (RFU) bit within loadflags/\/# flags, unused bits must be \
zero (RFU) bit within loadflags\//g" memdisk/init.S16 &&
  make installer

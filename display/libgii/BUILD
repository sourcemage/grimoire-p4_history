(
  if  grep UTS_RELEASE  /usr/include/linux/version.h | grep -q \"2.6; then
  sedit "s/EV_RST/EV_SYN/" input/linux_evdev/eventparse.c 
  fi &&
  default_build

)  >  ${C_FIFO}  2>&1

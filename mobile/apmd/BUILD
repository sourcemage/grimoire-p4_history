leave_config()  {
  if  [ -f /etc/apmd_proxy ] ; then
    sedit "s/^.*install.*apmd_proxy.*$/#/" Makefile
  fi
}

(
  sedit  "s/-O /$CFLAGS /"  Makefile

  # If xfree86 is not installed, do not compile xapm (as it would 
  # fail and break spell), Bug #491
  if !  spell_installed  "xfree86";  then
    sedit  's/EXES=apm apmd xapm apmsleep/EXES=apm apmd apmsleep/'     Makefile  &&
    sedit  's/install        xapm            ${PREFIX}/bin//'          Makefile  &&
    sedit  's/install -m 644 xapm.1          ${MANDIR}/man1/xapm.1//'  Makefile
  fi

patch apmsleep.c << PATCH
 --- apmsleep.c-old    2002-08-20 18:57:43.000000000 +0200
 +++ apmsleep.c        2002-08-20 19:09:54.000000000 +0200
 @@ -46,7 +46,11 @@
  #include <linux/version.h>
  
  #if LINUX_VERSION_CODE > KERNEL_VERSION(2,2,0)
 -#include <asm/spinlock.h>
 +# if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,19)
 +#  include <asm/spinlock.h>
 +# else
 +#  include <linux/spinlock.h>
 +# endif
  #endif
  
  #include <linux/mc146818rtc.h>
PATCH

  make                               &&
  prepare_install                    &&
  leave_config                       &&
  make    install

) > $C_FIFO 2>&1  &&

(
  cp  $SCRIPT_DIRECTORY/apmd.sh  /etc/init.d

  ln  -sf  ../init.d/apmd.sh  /etc/rc0.d/K75apmd
  ln  -sf  ../init.d/apmd.sh  /etc/rc6.d/K75apmd

  ln  -sf  ../init.d/apmd.sh  /etc/rc1.d/S25apmd
  ln  -sf  ../init.d/apmd.sh  /etc/rc2.d/S25apmd
  ln  -sf  ../init.d/apmd.sh  /etc/rc3.d/S25apmd
  ln  -sf  ../init.d/apmd.sh  /etc/rc4.d/S25apmd
  ln  -sf  ../init.d/apmd.sh  /etc/rc5.d/S25apmd

)

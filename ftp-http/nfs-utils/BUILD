unalias  make

(

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install             &&

  cp  $SCRIPT_DIRECTORY/nfslock.sh  /etc/init.d  &&
  cp  $SCRIPT_DIRECTORY/nfs.sh      /etc/init.d  &&

  case  $NFS_BOOT  in
    y|Y|j|J)  ln  -sf  ../init.d/nfs.sh  /etc/rc0.d/K60nfs
              ln  -sf  ../init.d/nfs.sh  /etc/rc1.d/K60nfs
              ln  -sf  ../init.d/nfs.sh  /etc/rc2.d/K60nfs
              ln  -sf  ../init.d/nfs.sh  /etc/rc6.d/K60nfs

              ln  -sf  ../init.d/nfs.sh  /etc/rc3.d/S40nfs
              ln  -sf  ../init.d/nfs.sh  /etc/rc4.d/S40nfs
              ln  -sf  ../init.d/nfs.sh  /etc/rc5.d/S40nfs
              ;;
          *)  true
              ;;
  esac  &&

  case  $NFSLOCK_BOOT  in
    y|Y|j|J)  ln  -sf  ../init.d/nfslock.sh  /etc/rc0.d/K60nfslock
              ln  -sf  ../init.d/nfslock.sh  /etc/rc1.d/K60nfslock
              ln  -sf  ../init.d/nfslock.sh  /etc/rc2.d/K60nfslock
              ln  -sf  ../init.d/nfslock.sh  /etc/rc6.d/K60nfslock

              ln  -sf  ../init.d/nfslock.sh  /etc/rc3.d/S40nfslock
              ln  -sf  ../init.d/nfslock.sh  /etc/rc4.d/S40nfslock
              ln  -sf  ../init.d/nfslock.sh  /etc/rc5.d/S40nfslock
              ;;
          *)  true
              ;;
  esac

) > $C_FIFO 2>&1

cd  /usr/src/linux

while  
  case  $CONFIG_KERNEL in
    y|Y)  make  menuconfig
          if  query  "Repeat menuconfig?  "  n
          then  CONFIG_KERNEL=y
          else  CONFIG_KERNEL=n
          fi     ;;
      *)  false  ;;
  esac
do
  true
done


backup_modules()  {

  if    [  -d  /lib/modules/$VERSION      ];  then
    rm   -rf   /lib/modules/$VERSION.old
    mv         /lib/modules/$VERSION      \
               /lib/modules/$VERSION.old
  fi

}


(

  yes  n  |  make  oldconfig
  cp  .config  $CONFIG_CACHE
  make  dep               &&
  make  bzImage           &&
  make  modules           &&
  prepare_install         &&
  backup_modules          &&
  make   modules_install  &&
  case  $BUILD  in
    powerpc-linux-gnu)  cp  arch/ppc/boot/bzImage   /boot/vmlinubz-$VERSION  ;;
                    *)  cp  arch/i386/boot/bzImage  /boot/vmlinubz-$VERSION  ;;
  esac

) > $C_FIFO 2>&1

(

#  sed  s/"const char \*what"/"__const char \*what"/ portmap.c > portmap.c~  &&
#  mv  portmap.c~  portmap.c  &&

  sedit  "s/const char \*what/__const char \*what/"  portmap.c  &&

  make  WRAP_DIR=/usr/lib  &&
  prepare_install          &&
  cp  portmap    /sbin     &&
  cp  pmap_dump  /sbin     &&
  cp  pmap_set   /sbin

) > $C_FIFO 2>&1  &&  (


  case  $PORTMAP_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/portmap.sh  /etc/init.d

              ln  -sf  ../init.d/portmap.sh  /etc/rc0.d/K70portmap
              ln  -sf  ../init.d/portmap.sh  /etc/rc1.d/K70portmap
              ln  -sf  ../init.d/portmap.sh  /etc/rc2.d/K70portmap
              ln  -sf  ../init.d/portmap.sh  /etc/rc6.d/K70portmap

              ln  -sf  ../init.d/portmap.sh  /etc/rc3.d/S30portmap
              ln  -sf  ../init.d/portmap.sh  /etc/rc4.d/S30portmap
              ln  -sf  ../init.d/portmap.sh  /etc/rc5.d/S30portmap
              ;;
          *)  true
              ;;
  esac

)

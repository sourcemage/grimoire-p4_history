config_isdn()  {

  if  [  -e  $CONFIG_CACHE/.config-$SPELL  ];  then

    cp $CONFIG_CACHE/.config-$SPELL .config

    read  -t 10  -n 1  -p "Configure $SPELL? "  CONFIRM
    case  $CONFIRM  in
      y|Y)  make  config  ;;
	*)  make  subconfig ;;
    esac

  else

    make  config

  fi

}


config_isdn
cp    .config  $CONFIG_CACHE/.config-$SPELL

(

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1

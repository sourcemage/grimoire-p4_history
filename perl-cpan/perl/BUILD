(
    unset LANG

    CONFIG="$DEPENDS_CONFIG/perl_config.sh"

    case  $OLD_CUSTOM  in

	y|Y) cp $CONFIG ./config.sh  &&
	      ./Configure -S         &&
	      make depend
	      ;;

	   *) case $NEW_CUSTOM  in
		 y|Y)  ./Configure  -Dprefix=/usr -Dlibperl=libperl.so   &&
			cp config.sh $CONFIG                             &&
			echo "OLD_CUSTOM=y" | cat > $DEPENDS_CONFIG/perl &&
			echo "NEW_CUSTOM=n" | cat > $DEPENDS_CONFIG/perl
			;;
		    *)  ./Configure  -Dprefix=/usr -d -e  \
			    -Dusethreads -Ulocincpth -Dlibperl=libperl.so
			;;
	      esac
    esac             &&

    make             &&
    prepare_install  &&
    make    install

) > $C_FIFO 2>&1

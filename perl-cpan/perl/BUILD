(
    unset LANG

    # save current version so we can do a POST_INSTALL
    #
    CURRENT_VERSION="`installed_version perl`"
    CONFIG="$DEPENDS_CONFIG/perl_config.sh"

    patch -p1 < $SCRIPT_DIRECTORY/installperl.patch  &&

    case  $OLD_CUSTOM  in

	y|Y) cp $CONFIG ./config.sh  &&
	      ./Configure -S         &&
	      make depend
	      ;;

	   *) case $NEW_CUSTOM  in
		 y|Y)  ./Configure -Ui_db -Dprefix=/usr -Dlibperl=libperl.so &&
			cp config.sh $CONFIG                                 &&
			echo "OLD_CUSTOM=y" | cat > $DEPENDS_CONFIG/perl     &&
			echo "NEW_CUSTOM=n" | cat > $DEPENDS_CONFIG/perl
			;;
		    *)  ./Configure  -Dprefix=/usr -d -e  -Ui_db             \
			    -Dusethreads -Ulocincpth -Dlibperl=libperl.so
			;;
	      esac
    esac                                             &&

    make                                             &&
    prepare_install                                  &&
    make    install

) > $C_FIFO 2>&1

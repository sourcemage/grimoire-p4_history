# $Id: BUILD,v 1.1 2002/07/29 23:53:53 sergeyli Exp $
(
	cp ./includes/config.php ./includes/config.php.default &&

	prepare_install                                        &&

	mkdir -p   /usr/share/$SPELL                           &&
	cp    -r . /usr/share/$SPELL/
    
) > $C_FIFO 2>&1 && (

	echo "Please point your apache at /usr/share/$SPELL/"
	echo "Rename /usr/share/$SPELL/includes/config.php.default to config.php"

)

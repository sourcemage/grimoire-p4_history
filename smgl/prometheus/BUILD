(
	prepare_install &&
	./install       &&
sedit '63a\
\    -re \"Which one do you want\\[^\\n]*\\\\\\[\?]\" {send \"0\\r\"}\' /usr/sbin/pm-autocast
) > $C_FIFO 2>&1

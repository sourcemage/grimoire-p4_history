if [ ! -f /selinux/policyvers ] ; then
	message "${PROBLEM_COLOR}You don't have selinuxfs mounted on your system\ntry # mount -t selinuxfs none /selinux${DEFAULT_COLOR}" &&
	return 1
fi &&
echo CFLAGS = $CFLAGS
sedit  "s:\-g \$(OPTIONS) \-Wall \-O2 \-pipe:${CFLAGS} \$(OPTIONS):"  Makefile
make

./configure --sysvdir=/tmp/dansbuild	\
	    --cgidir=$CGIDIR		\
	    --runas_usr=nobody		\
	    --runas_grp=nogroup		\
	    --piddir=/var/run		\
	    --logrotatedir=/tmp/dansbuild \
	    --gccver=3			\
	    $OPTS			&&

make					&&
rm -rf /tmp/dansbuild

(
  sedit "/partimag.root/d" Makefile.am	&&
#  ./autogen.sh 			&&
#  touch mkinstalldirs			&&
  echo "mkdir -p \$1" > ./mkinstalldirs &&
  chmod u+x ./mkinstalldirs		&&
  default_build

) > $C_FIFO 2>&1

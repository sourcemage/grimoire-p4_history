(

  if [ "$CVS" = "yes" ]; then

    echo "mkdir -p \$1" > ./mkinstalldirs  &&
    ./makeconf.sh

  fi  &&

  default_build

) > $C_FIFO 2>&1

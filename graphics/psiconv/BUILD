case $VERSION in
	0.8.2)  patch -p1 < $SCRIPT_DIRECTORY/$SPELL-0.8.2.patch    ;;
        0.8.3)  sedit  "s:magick/config.h:magick/magick_config.h:"  \
                       program/psiconv/magick-aux.c                 ;;
esac

default_build

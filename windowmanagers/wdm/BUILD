(

  ./configure  --build=${BUILD}                     \
               --prefix=/usr                        \
               --sysconfdir=/etc                    \
               --localstatedir=/var                 \
               --with-gfx-incs=/usr/include/WINGs   \
               ${OPTS}                              &&

  sedit  "s:/usr/etc:/etc:g"  Makefile              &&

  make                                              &&
  prepare_install                                   &&
  make    install                                   &&
  sedit "s:usr/etc:etc:g"  /etc/wdm/wdm-config      &&
  echo  "DisplayManager*wdmLogo:   \
        /usr/share/pixmaps/wdm/smgl_logo.xpm" \
        >> /etc/wdm/wdm-config                      &&
  cp $SCRIPT_DIRECTORY/smgl_logo.xpm /usr/share/pixmaps/wdm/

)  >  ${C_FIFO}  2>&1

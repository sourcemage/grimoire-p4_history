(

  ./configure  --build=${BUILD}                     \
               --prefix=/usr                        \
               --with-wdmdir=/etc/wdm               \
               --localstatedir=/var                 \
               --with-gfx-incs=/usr/include/WINGs   \
               ${OPTS}                              &&

  make                                              &&
  prepare_install                                   &&
  make    install                                   &&
  echo  "DisplayManager*wdmLogo:   \
        /usr/share/pixmaps/wdm/smgl_logo.xpm" \
        >> /etc/wdm/wdm-config                      &&
  cp $SCRIPT_DIRECTORY/smgl_logo.xpm /usr/share/pixmaps/wdm/

)  >  ${C_FIFO}  2>&1

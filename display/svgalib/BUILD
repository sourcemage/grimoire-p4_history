(

  #
  # Apply patches for 2.6 and gcc 3.3, 3.4
  #
  for  i  in  svgalib-1.9.18-gcc33.patch        \
              svgalib-1.9.18-gcc34.patch        \
              svgalib-1.9.18-linux2.6-v2.patch  \
              svgalib-1.9.18-gentoo.patch
  do
    patch  -p1  <  ${SCRIPT_DIRECTORY}/$i
  done                                          &&

  # Some other fixes I needed to do
  sedit  's:<config.h>:\"config.h\":'  threeDKit/3dinit.c     &&
  sedit  's:<config.h>:\"config.h\":'  threeDKit/3dkit.c      &&
  sedit  's:<config.h>:\"config.h\":'  threeDKit/triangl.c    &&
  sedit  's:<config.h>:\"config.h\":'  threeDKit/wrapsurf.c   &&

  #
  # Some fixes from Gentoo's ebuild
  # http://www.gentoo.org/cgi-bin/viewcvs.cgi/media-libs/svgalib/svgalib-1.9.18-r1.ebuild?rev=1.1&content-type=text/vnd.viewcvs-markup
  #

  # Disable kernel module support while building stages
  sedit  's:installmodule ::'  Makefile                                  &&

  # First build static
  make  static                                                           &&

  # Have to remove for shared to build ...
  rm  -f  src/svgalib_helper.h                                           &&
  # Then build shared ...
  make  shared                                                           &&

  # Missing in some cases ...
  ln  -s  libvga.so.${VERSION}  sharedlib/libvga.so                      &&
  # Build lrmi and tools ...
  make  LDFLAGS="-L../sharedlib"  textutils  lrmi  utils                 &&
  # Build the gl stuff too
  make  -C  gl                                                           &&
  make  -C  gl  libvgagl.so.${VERSION}                                   &&
  # Missing in some cases ...
  ln  -s  libvgagl.so.${VERSION}  sharedlib/libvgagl.so                  &&
  rm  -f  src/svgalib_helper.h                                           &&
  make  -C  src  libvga.so.${VERSION}                                    &&
  cp  -a  src/libvga.so.${VERSION}  sharedlib/                           &&
  # Build threeDKit ...
  make  LDFLAGS='-L../sharedlib'  -C  threeDKit  lib3dkit.a              &&
  # Build demo's ...
  make  CFLAGS="${CFLAGS} -I../gl" demoprogs  LDFLAGS='-L../sharedlib'   &&

  cd  kernel/svgalib_helper                                              &&
  env  -u  ARCH                                                          \
  make  -f  Makefile.alt INCLUDEDIR="/usr/src/linux/include"             \
  clean  modules                                                         &&
  cd  -                                                                  &&

  sedit 's/\(install: $(INSTALLAOUTLIB) \)installheaders \(.*\)/\1\2/g'  \
  Makefile                                                               &&

  prepare_install                                                        &&
  make  prefix=${INSTALL_ROOT}/usr  install                              &&
  cd  kernel/svgalib_helper                                              &&
  env  -u  ARCH                                                          \
  make  -f  Makefile.alt    prefix=${INSTALL_ROOT}                       \
  INCLUDEDIR="/usr/src/linux/include"  modules_install

) > $C_FIFO 2>&1

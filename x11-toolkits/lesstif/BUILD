(
  ./configure  --prefix=/usr       \
               --sysconfdir=/etc   \
               --enable-production \
               --disable-debug     \
               --enable-static     \
               --enable-build-12   \
               --enable-build-20   \
               --enable-build-21   \
               $OPTS               &&

#All in makefile
  sedit 's:rootdir = $(prefix)/LessTif:rootdir = $(prefix)/share/doc/lesstif:' Makefile  &&

  sedit 's:rootdir = $(prefix)/LessTif:rootdir = $(prefix)/share/doc/lesstif:' doc/Makefile  &&

  sedit 's:htmldir = $(prefix)/LessTif/doc:htmldir = $(prefix)/share/doc/lesstif/doc:' Makefile  &&
#All in doc lessdox dir
  sedit 's:htmldir = $(prefix)/LessTif/doc/html:htmldir = $(prefix)/share/doc/lesstif/doc:' doc/lessdox/clients/Makefile  &&

  sedit 's:htmldir = $(prefix)/LessTif/doc/html:htmldir = $(prefix)/share/doc/lesstif/doc:' doc/lessdox/functions/Makefile  &&

  sedit 's:htmldir = $(prefix)/LessTif/doc/html:htmldir = $(prefix)/share/doc/lesstif/doc/html:' doc/lessdox/widgets/Makefile  &&
#All in www.lesstif.org dir
  sedit 's:docdir = $(prefix)/LessTif/doc:docdir = $(prefix)/share/doc/lesstif:' doc/www.lesstif.org/Makefile  &&

  sedit 's:rootdir = $(prefix)/LessTif/doc/images:docdir = $(prefix)/share/doc/lesstif/images:' doc/www.lesstif.org/images/Makefile  &&
  make                             &&
  prepare_install                  &&
  make    install           &&
#Unorthodox removal post install... it's empty the only thing in it is borked link... which I'm not in 
#the mood of finding in the fscking damn Makefiles of lesstif... it's dangerous...
  rm -rf /usr/LessTif
  
) > $C_FIFO 2>&1

# fix bug #6403
sedit  's/ARCHFLAGS="-mcpu=i786 -march=$arch"/ARCHFLAGS=""/'  configure  &&
sedit  's/ARCHFLAGS="-mcpu=i686 -march=$arch"/ARCHFLAGS=""/'  configure  &&
sedit  's/ARCHFLAGS="-mcpu=i586 -march=$arch"/ARCHFLAGS=""/'  configure  &&

# don't remove PIC from CFLAGS

# gcc 3.4 fix
sedit  's/KEEP_SOURCE:/KEEP_SOURCE: ;/'  lavtools/lavpipe.c   &&
sedit  's/(uint8_t \*)/uint8_t */'       mpeg2enc/picture.cc  &&
make_single                                                   &&
default_build                                                 &&
make_normal

#the makefile that comes with id3v2 doesnt put things where we want them,
#so im just including one that does, one could also patch the makefile,
#but this is easier

all: id3v2

id3v2: Makefile convert.cpp list.cpp id3v2.cpp convert.cpp
	g++ ${CFLAGS} -lz -lid3 -o id3v2 id3v2.cpp list.cpp convert.cpp

install: all
	install -c -m 755 -o 0 -s id3v2 /usr/bin/



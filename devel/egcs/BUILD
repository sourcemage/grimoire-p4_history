  patch -p1 < $SCRIPT_DIRECTORY/egcs-1.1.2-glibc-2.2.patch 	&&
  sedit  's:#!/bin/sh:#!/bin/bash:'  $SOURCE_DIRECTORY/configure  &&

  ./configure  --host=$BUILD          				\
               --prefix=/opt/egcs     				\
               --enable-shared   				\
	       $OPTS						&&
  make  bootstrap 

(
 sedit  's:DESTDIR=/usr/local:DESTDIR=/usr:'  makevars   &&
 
 # remove the deprecated warnings.
 sedit  's:-Wall:-Wall -Wno-deprecated:'  makevars   &&
 
 # deal with a bad include statement in the examples code.
 sedit  '/#include <ga\/GARealGenome.C>/D' examples/ex21.C &&
 sedit  '/#include <ga\/GARealGenome.C>/D' examples/ex23.C   &&
 sedit  '/#include <ga\/GARealGenome.C>/D' examples/ex24.C   &&
 sedit  '/#include <ga\/GARealGenome.C>/D' examples/graphic/gaview.C   &&

 if grep -q 'examples="n"' ${SPELL_CONFIG}
  then 
  sedit  's:cd examples; make::' makefile              
 fi                                                      &&

 make                                                    &&
 prepare_install                                         &&
 make install                                            &&
 sedit 's:../examples/README.html:examples/README.html:' doc/GAlib.html &&
 mkdir -p /usr/doc/galib                                 &&
 cp -a doc/* /usr/doc/galib                              &&
 if grep -q 'examples="y"'  ${SPELL_CONFIG}
  then
  mkdir -p /usr/share/galib /usr/share/galib/src         \
  /usr/share/galib/bin                                     &&
  find ./examples -type f -perm 755 -exec                  \
  sh -c  'cp {} /usr/share/galib/bin &&                    \
  cp {}?C /usr/share/galib/src'  \;                        &&
  cp makevars /usr/share/galib/src                         &&
  sedit 's:GA_INC_DIR= ..:#GA_INC_DIR= ..:' examples/makefile &&
  sedit 's:GA_LIB_DIR= ../ga:#GA_LIB_DIR= ../ga:' examples/makefile &&
  sedit 's:#GA_LIB_DIR= /usr/local/lib:GA_LIB_DIR= /usr/lib:' examples/makefile &&
  sedit 's:#GA_INC_DIR= /usr/local/include:GA_INC_DIR= /usr/include:' examples/makefile &&
  cp examples/makefile /usr/share/galib/src                &&
  ln -s /usr/share/galib/bin/* /usr/bin                    &&
  mkdir -p /usr/doc/galib/examples                         &&
  cp examples/README.html /usr/doc/galib/examples          &&
  ln -s /usr/share/galib/src/* /usr/doc/galib/examples 
 fi                                               
) > $C_FIFO 2>&1

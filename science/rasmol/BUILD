(
 prepare_install                             &&
 gunzip doc/rasmol.1.gz                      &&
 cd src                                      &&
 ln -s ../doc .                              &&
 ln -s ../data .                             &&
 xmkmf                                       &&
 make                                        &&
 make install
) > $C_FIFO 2>&1

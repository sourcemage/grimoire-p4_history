(

 ./build ${OPTS}                                                       &&
 prepare_install                                                       &&
 mkdir -p /usr/share/eclipse                                           &&
 chmod a+x ./eclipse                                                   &&
 cp -a * /usr/share/eclipse                                            &&
 echo "/usr/share/eclipse/eclipse -data ~/workspace" > eclipse-script  &&
 chmod a+rx eclipse-script                                             &&
 cp eclipse-script /usr/bin/eclipse

) > $C_FIFO 2>&1

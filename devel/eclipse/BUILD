(

 ./build ${OPTS}                                                       &&
 prepare_install                                                       &&
 mkdir -p /usr/share/eclipse                                           &&
 chmod a+x ./eclipse                                                   &&
 cp -a * /usr/share/eclipse                                            &&
 echo "/usr/share/eclipse/eclipse -data ~/workspace" > eclipse-script  &&
 chmod a+rx eclipse-script                                             &&
 cp eclipse-script /usr/bin/eclipse                                    &&

 if [ "$SSH2" = "y" ] ; then
    unzip ${SOURCE_CACHE}/${SOURCE2} -d ${INSTALL_ROOT}/usr/share/eclipse/plugins
 fi  

) > $C_FIFO 2>&1

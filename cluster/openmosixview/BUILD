(
sedit '8,13D' setup				&&
for i in $(grep -rl CFLAGS= .);
do sedit "s/CFLAGS\=/CFLAGS\=$CFLAGS/g" $i
done
    prepare_install                          	&&
ln -s /usr/src/linux/include/hpc /usr/include   &&
    ./setup					&&
    cd 3dmon					&&
    ./setup.standalone

echo "now type openmosixview <ENTER> and have fun!"
echo "(do not forget to copy the openmosixprocs binary to /usr/bin of each"
echo "your cluster-nodes e.g"
echo " rcp /usr/bin/openmosixprocs hostname_of_node:/usr/bin"
echo "or if you use SSH"
echo " scp /usr/bin/openmosixprocs hostname_of_node:/usr/bin"
echo "reply problems during installation to mosixview@t-online.de"
echo "Thanks"

#   /bin/cp -v openmosixcollector/openmosixcollector.init       \
#                            /etc/init.d/openmosixcollector.sh  &&
#   for  RUNLEVEL  in  3  4  5
#   do
#     ln  -svf  /etc/init.d/openmosixcollector.sh               \
#       /etc/rc${RUNLEVEL}.d/S55openmosixcollector
#   done
#
#  for  RUNLEVEL  in  0  1  2  6
#   do
#     ln  -svf  /etc/init.d/openmosixcollector.sh               \
#       /etc/rc${RUNLEVEL}.d/K45openmosixcollector
#   done

) > $C_FIFO 2>&1

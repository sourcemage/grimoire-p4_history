if [ "${SOLIDW}" != "y" ] ; then
	sed -i 's/DEFINES += -DSOLIDDRAG/\#DEFINES += -DSOLIDDRAG/g' Makefile
fi &&
if [ "${INFOBANNER}" != "y" ] ; then
	sed -i 's/DEFINES += -DINFOBANNER/\#DEFINES += -DINFOBANNER/g' Makefile
fi &&
if [ "${BANMOVE}" == "y" ] ; then
	sed -i 's/\#DEFINES += -DINFOBANNER\_MOVERESIZE/DEFINES += -DINFOBANNER_MOVERESIZE/g' Makefile
fi &&
if [ "${SNAPBORDER}" != "y" ] ; then
	sed -i 's/DEFINES += -DSNAP/\#DEFINES += -DSNAP/g' Makefile
fi &&
if [ "${TEXTMESSAGES}" != "y" ] ; then
	sed -i 's/DEFINES += -DSTDIO/\#DEFINES += -DSTDIO/g' Makefile
fi &&
if [ `echo ${OPTS} | grep -q USEMOTIF` ] ; then
	sed -i 's/DEFINES += -DSTDIO/\#DEFINES += -DSTDIO/g' Makefile
fi &&
if [ `echo ${OPTS} | grep -q USEVDESK` ] ; then
	sed -i 's/DEFINES += -DVWM/\#DEFINES += -DVWM/g' Makefile &&
	sed -i 's/\#DEFINES += -DVDESK/DEFINES += -DVDESK/g' Makefile
fi
make

sed -i 's/MANDIR\ =\ $(DESTDIR)$(XROOT)\/man\/man1/MANDIR\ =\ ${INSTALL_ROOT}\/usr\/share\/man\/man1/g' Makefile &&
sed -i 's/BINDIR\ =\ $(DESTDIR)$(XROOT)\/bin/BINDIR\ =\ ${INSTALL_ROOT}\/usr\/bin/g' Makefile                    &&
sed -i 's/lucidasans-10/fixed/g' ${SOURCE_DIRECTORY}/windowlab.h &&
if echo ${OPTS} | grep -q USEMOTIF ; then
    sed -i 's/\#DEFINES\ +=\ -DMWM\_HINTS/DEFINES\ +=\ -DMWM\_HINTS/g' ${SOURCE_DIRECTORY}/Makefile
fi   &&
make

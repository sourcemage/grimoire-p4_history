if ! spell_installed gnome-core; then

     cp Makefile.in Makefile.in.orig
     grep -v "\$(APPLET)" Makefile.in.orig > Makefile.in
     cp Makefile.am Makefile.am.orig
     grep -v "\$(APPLET)" Makefile.am.orig > Makefile.am

     sedit "s/gpilotd applet capplet/gpilotd capplet/" Makefile.in
     sedit "s/gpilotd applet capplet/gpilotd capplet/" Makefile.am

fi

default_build

if  [  "$CVS"  ==  "y"  ];  then 
	( patch -p0 < $SCRIPT_DIRECTORY/pekwm-shape.diff || die )
fi

[  "$HARBOUR" = y  ]  &&  OPTS="$OPTS --enable-harbour"
[  "$XINERAMA" = y  ]  &&  OPTS="$OPTS --enable-xinerama"

default_build

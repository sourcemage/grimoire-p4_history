if  [  "$OPENVRML_IMAGE"  =  "y"  ];  then
  OPTS="$OPTS  --enable-imagetexture-node"
else
  OPTS="$OPTS  --disable-imagetexture-node"
fi  &&

if  [  "$OPENVRML_TEXT"  =  "y"  ];  then
  OPTS="$OPTS  --enable-text-node"
else
  OPTS="$OPTS  --disable-text-node"
fi  &&

if  [  "$OPENVRML_JAVA"  =  "y"  ];  then
  OPTS="$OPTS  --enable-script-node-java"
else
  OPTS="$OPTS  --disable-script-node-java"
fi  &&

if  [  "$OPENVRML_JS"  =  "y"  ];  then
  OPTS="$OPTS  --enable-script-node-javascript"
else
  OPTS="$OPTS  --disable-script-node-javascript"
fi  &&

if  [  "$OPENVRML_LOOKAT"  =  "y"  ];  then
  OPTS="$OPTS  --enable-lookat"
else
  OPTS="$OPTS  --disable-lookat"
fi  &&

#
# Tests need some "DejaGNU" package...
#
OPTS="$OPTS  --disable-tests"  &&

#
# Mozilla plugin is broken with mozilla 1.7.5
#
OPTS="$OPTS  --disable-mozilla-plugin"  &&

default_build

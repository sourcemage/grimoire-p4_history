patch -p1 < $SCRIPT_DIRECTORY/python-2.4.patch &&
if echo $OPTS | grep -q -- "--disable-gui"; then
  sedit  's/"btdownloadgui.py",//'     setup.py  &&
  sedit  's/"btcompletedirgui.py",//'  setup.py
fi  &&
true

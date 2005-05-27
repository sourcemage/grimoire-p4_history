# disable spcdec, it's missing the .Asm files in 0.8.9
OPTS="$OPTS --disable-spc"  &&

OPTS="$OPTS --disable-examples --disable-tests"  &&
if spell_ok nvidia_driver; then
  # nvidia_driver breaks the opengl sink, bug #8361
  OPTS="$OPTS --disable-opengl"
fi  &&
default_build

# TODO define arch and windowing system
# possible values are in ./build
ws=gtk                                                               &&
if uname -m | grep -q 'i.\+86'; then
  arch=x86
fi                                                                   &&
./build -os linux -ws "$ws" -arch "$arch"                            &&
echo '/usr/share/eclipse/eclipse -data ~/workspace' > eclipse-script &&
chmod 755 eclipse-script


#
# We don't want to install into /usr/local, so
# we'll just copy the files correctly
#
patch  -p0  <  ${SCRIPT_DIRECTORY}/mk.diff  &&

#
# Should be made to allow someone to say "n" even if
# the package is installed, but this is the easy way
# I'm doing it for now. :)
#
if  spell_ok  tcp_wrappers;  then
  sedit  "s:undef VSF_BUILD_TCPWRAPPERS:define VSF_BUILD_TCPWRAPPERS:"  builddefs.h
fi  &&

if  spell_ok  openssl;  then
  sedit  "s:undef VSF_BUILD_SSL:define VSF_BUILD_SSL:"  builddefs.h
fi  &&

#
# builddefs.h defaults to using Linux-PAM
#
if  !  spell_ok  linux-pam;  then
  sedit  "s:define VSF_BUILD_PAM:undef VSF_BUILD_PAM:"  builddefs.h
fi  &&

make


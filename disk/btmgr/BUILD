# Patch manager/helptool.h in order to correct the asm endblock macro
# btmgr will not compile without this patch, because of newer version of nasm
patch -p1 < $SCRIPT_DIRECTORY/endblock_macro_patch 	&&
make

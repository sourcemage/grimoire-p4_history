(

message "${MESSAGE_COLOR} Aplying patch to enable multiple texmf trees ${DEFAULT_COLOR}"	&&
gzip -d < $SCRIPT_DIRECTORY/texmf.patch.gz | patch -p1 -E	&&

prepare_install                                   &&
mkdir  -p                       /usr/share/texmf  &&
cp     -r  $SOURCE_DIRECTORY/*  /usr/share/texmf

) > $C_FIFO 2>&1

#right install paths
sedit 's/\/usr\/local/\/usr/' config.mk &&
sedit 's/\${PREFIX}\/etc/\/etc/' config.mk &&
#ugly hack to prevent static linking
sedit 's/-static//' cmd/Makefile &&
#path to the plan9 binaries from rc9 spell
sedit 's/\${PREFIX}\/9/\/opt\/9/' config.mk &&

make 

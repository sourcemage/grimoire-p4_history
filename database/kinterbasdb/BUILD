(
 cp setup.cfg setup.cfg.cp		&&
  patch -p0 setup.cfg < $SPELL_DIRECTORY/cfg.diff &&  
#  sedit "s;Lib/site;lib/site;" setup.py &&
#  export PATH=/usr/firebird/lib:%PATH	&&  
#cat >> setup.cfg <<EOF
#database_home_dir=/opt/firebird
#database_include_dir=/usr/include/firebird
#database_lib_name=
#EOF
  python setup.py build			&& 
  prepare_install			&&
  python setup.py install 
#  mkdir -p /usr/share/FirebirdSQL	&&
#  cp -r * /usr/share/FirebirdSQL/
) > $C_FIFO 2>&1

if  spell_installed  mozilla;  then
  sed s/"LDFLAGS=\"\$_save_ldflags -L\$_mozilla_lib_place \$_mozilla_all_nspr_flags -lgtkembedmoz \$_mozilla_xpcom_libs\""/"LDFLAGS=\"\$_save_ldflags -L\$_mozilla_lib_place \$_mozilla_all_nspr_flags \$_mozilla_gtk_super_win_libs -lgtkembedmoz \$_mozilla_xpcom_libs\""/ configure > configure~
  mv configure~ configure
  chmod a+x configure
fi

default_build

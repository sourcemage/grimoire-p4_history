(

  if httpd -v | grep -q "Apache/2\."; then
    message "${MESSAGE_COLOR}Compiling for Apache 2${DEFAULT_COLOR}" &&
    patch -p1 < $SCRIPT_DIRECTORY/Makefile.patch &&
    mv Makefile.AP2 Makefile &&

    # fix deprecated Apache 1.3 functions
    for f in $(ls *.c); do
      sedit 's|ap_null_cleanup|apr_pool_cleanup_null|g' $f &&
      sedit 's|ap_palloc|apr_palloc|g' $f &&
      sedit 's|ap_pcalloc|apr_pcalloc|g' $f &&
      sedit 's|ap_pstrcat|apr_pstrcat|g' $f &&
      sedit 's|ap_psprintf|apr_psprintf|g' $f &&
      sedit 's|ap_pstrdup|apr_pstrdup|g' $f &&
      sedit 's|ap_pstrndup|apr_pstrndup|g' $f &&
      sedit 's|ap_copy_table|apr_copy_table|g' $f &&
      sedit 's|ap_table_get|apr_table_get|g' $f &&
      sedit 's|ap_make_array|apr_make_array|g' $f &&
      sedit 's|ap_make_table|apr_make_table|g' $f
    done &&

    make &&
    INSTALL_CMD='make install'
  else
    message "${MESSAGE_COLOR}Compiling for Apache 1.3${DEFAULT_COLOR}" &&
    apxs -o mod_fastcgi.so -c *.c &&
    INSTALL_CMD='apxs -a -i -n fastcgi mod_fastcgi.so'
  fi &&
  prepare_install &&
  $INSTALL_CMD

) > $C_FIFO 2>&1

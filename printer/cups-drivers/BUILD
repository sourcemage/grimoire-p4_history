(

  prepare_install                            &&
  cp     -r  usr/*            /usr           &&
  mkdir  -p  /etc/cups                       &&
  cp     -r  var/cups/conf/*  /etc/cups      &&

#  cp     -r   var/*            /var

  cp     -r  var/cups/filter  /usr/lib/cups  &&
  cp     -r  var/cups/utils   /usr/lib/cups

) > $C_FIFO 2>&1
